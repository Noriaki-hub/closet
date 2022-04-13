import * as functions from "firebase-functions";
import {db, firestore} from "../firebase";
import {DocumentData} from "@google-cloud/firestore";

// closet追加を検知してstatusインクリメント
export const createCloset = functions
    .region("asia-northeast1")
    .firestore.document("users/{userId}/status/{status}/closet/{clothesId}")
    .onCreate(async (snapshot) => {
      const data: DocumentData = snapshot.data();
      if (data === null) return;

      const uesrStatusClosetRef = db
          .collection("users")
          .doc(data.uid)
          .collection("status")
          .doc("status");
      await uesrStatusClosetRef.update({
        clothesCount: firestore.FieldValue.increment(1),
        clothesAllCount: firestore.FieldValue.increment(1),
        buying: firestore.FieldValue.increment(data.price),
      });
      console.log("インクリメントstatusトリガー");
      return Promise.resolve();
    });
