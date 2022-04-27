import * as functions from "firebase-functions";
import { db, firestore } from "../firebase";
import { DocumentData } from "@google-cloud/firestore";

// フォローを検知してインクリメント
export const incrementBrandFollower = functions
  .region("asia-northeast1")
  .firestore.document("brands/{brandId}/follower/{userId}")
  .onCreate(async (snapshot) => {
    const data: DocumentData = snapshot.data();
    if (data === null) return;

    const brandsRef = db.collection("brands").doc(String(data.brandId));
    await brandsRef.update({follower: firestore.FieldValue.increment(1)});

    console.log("ブランドフォロワーインクリメント");

    return Promise.resolve();
  });

  // フォロー解除を検知してでクリメント
export const decrementBrandFollower = functions
.region("asia-northeast1")
.firestore.document("brands/{brandId}/follower/{userId}")
.onDelete(async (snapshot) => {
  const data: DocumentData = snapshot.data();
  if (data === null) return;

  const brandsRef = db.collection("brands").doc(String(data.brandId));
  await brandsRef.update({follower: firestore.FieldValue.increment(-1)});

  console.log("ブランドフォロワーデクリメント");

  return Promise.resolve();
});

