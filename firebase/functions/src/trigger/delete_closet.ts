import * as functions from "firebase-functions";
import {db, firestore} from "../firebase";
import {DocumentData} from "@google-cloud/firestore";

// closet追加を検知してstatusデクリメント
export const deleteCloset = functions
    .region("asia-northeast1")
    .firestore.document("users/{userId}/status/{status}/closet/{clothesId}")
    .onDelete(async (snapshot) => {
      const data: DocumentData = snapshot.data();
      if (data === null) return;

      const uesrStatusClosetRef = db
          .collection("users")
          .doc(data.uid)
          .collection("status")
          .doc("status");
      await uesrStatusClosetRef.update({
        clothesCount: firestore.FieldValue.increment(-1),
        clothesAllCount: firestore.FieldValue.increment(-1),
        buying: firestore.FieldValue.increment(-data.price),
        likedCount: firestore.FieldValue.increment(-data.likedCount),
        selling: firestore.FieldValue.increment(-data.selling),
      });
      console.log("デクリメントstatusトリガー");
      return Promise.resolve();
    });
