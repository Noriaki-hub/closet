import * as functions from "firebase-functions";
import {db} from "../firebase";
import {DocumentData} from "@google-cloud/firestore";

export const updateClothes = functions
    .region("asia-northeast1")
    .firestore.document("clothes/{clothesId}")
    .onUpdate(async (change) => {
      const afterData: DocumentData = change.after.data();
      await copyToUserCloset(afterData);
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
  console.log("編集トリガー1");
};

// フォロワー取得
const copyToFollowerTimeline = async (data: DocumentData) => {
  const followerRef = db
      .collection("users")
      .doc(data.uid)
      .collection("follower")
      .get();
  await followerRef.then((snapshot) => {
    snapshot.docs.forEach((doc) => {
      console.log("編集トリガー2");
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
  console.log("編集トリガー3");
};
