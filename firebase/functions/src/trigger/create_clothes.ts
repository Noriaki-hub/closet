import * as functions from "firebase-functions";
import { db } from "../firebase";
import { DocumentData } from "@google-cloud/firestore";

// clothes追加を検知してclosetに追加
export const createClothes = functions
  .region("asia-northeast1")
  .firestore.document("clothes/{clothesId}")
  .onCreate(async (snapshot) => {
    const data: DocumentData = snapshot.data();
    if (data === null) return;

    const uesrStatusRef = db.collection("users").doc(data.uid).collection("status").doc("status").collection("closet");
    await uesrStatusRef.doc(data.itemId).set(data);
    console.log("clothes作成トリガー");

    const brandsClothesRef = db.collection("brands").doc(String(data.brandId)).collection("clothes");

    await brandsClothesRef.doc(data.itemId).set({ itemId: data.itemId });
    console.log("brandsClothes作成トリガー");

    return Promise.resolve();
  });
