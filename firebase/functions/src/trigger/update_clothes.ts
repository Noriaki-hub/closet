import * as functions from "firebase-functions";
import {db} from "../firebase";
import {Clothes} from "../types";
import {DocumentData} from "@google-cloud/firestore";

export const updateClothes = functions
    .region("asia-northeast1")
    .firestore.document("clothes/{clothesId}")
    .onUpdate(async (change) => {
      const data: Clothes = change.after.data() as Clothes;
      console.log("編集トリガー1");
      await copyToUsersPublic(data);
      return Promise.resolve();
    });

// フォロワー取得
const copyToUsersPublic = async (data: Clothes) => {
  const followerRef = db
      .collection("users")
      .doc(data.uid)
      .collection("follower")
      .get();
  await followerRef.then((snapshot) => {
    snapshot.docs.forEach((doc) => {
      console.log("編集トリガー2");
      const user: DocumentData = doc.data() as DocumentData;

      copyToFollowerTimeline(user.uid, data);
    });
  });
};
// 各タイムラインにコピー
const copyToFollowerTimeline = async (userId: string, data: Clothes) => {
  console.log("編集トリガー3");
  const timelineRef = db
      .collection("users")
      .doc(userId)
      .collection("timeline")
      .doc("clothes")
      .collection("clothes")
      .doc(data.itemId);
  timelineRef.set(data);
  console.log("編集トリガー4");
};
