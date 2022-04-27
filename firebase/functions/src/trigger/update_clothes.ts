import * as functions from "firebase-functions";
import { db } from "../firebase";
import { DocumentData } from "@google-cloud/firestore";

export const updateClothes = functions
  .region("asia-northeast1")
  .firestore.document("clothes/{clothesId}")
  .onUpdate(async (change) => {
    const afterData: DocumentData = change.after.data();
    const beforeData: DocumentData = change.before.data();
    await copyToUserCloset(afterData);
    if (afterData.brandId !== beforeData.brandId) {
      await changeToBrandsClothes(afterData, beforeData);
    }
    copyToFollowerTimeline(afterData);
    return Promise.resolve();
  });

// closetにコピー
const copyToUserCloset = async (data: DocumentData) => {
  const timelineRef = db
    .collection("users")
    .doc(data.uid)
    .collection("status")
    .doc("status")
    .collection("closet")
    .doc(data.itemId);
  timelineRef.set(data);

  console.log("クローゼットコピー");
};

// brandsを変更
const changeToBrandsClothes = async (afterData: DocumentData, beforeData: DocumentData) => {
  const afterBrandsClothesRef = db
    .collection("brands")
    .doc(String(afterData.brandId))
    .collection("clothes")
    .doc(afterData.itemId);
  await afterBrandsClothesRef.set({ itemId: afterData.itemId });

  const beforeBrandsClothesRef = db
    .collection("brands")
    .doc(String(beforeData.brandId))
    .collection("clothes")
    .doc(beforeData.itemId);
  await beforeBrandsClothesRef.delete();

  console.log("ブランド変更");
};

// フォロワー取得
const copyToFollowerTimeline = async (data: DocumentData) => {
  const followerRef = db.collection("users").doc(data.uid).collection("follower").get();
  await followerRef.then((snapshot) => {
    snapshot.docs.forEach((doc) => {
      console.log("フォロワー取得");
      const user: DocumentData = doc.data() as DocumentData;

      copyToTimeLine(user.uid, data);
    });
  });
};
// 各タイムラインにコピー
const copyToTimeLine = async (userId: string, data: DocumentData) => {
  const timelineRef = db
    .collection("users")
    .doc(userId)
    .collection("timeline")
    .doc("clothes")
    .collection("clothes")
    .doc(data.itemId);
  timelineRef.set(data);
  console.log("タイムラインにコピー");
};
