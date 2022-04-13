import * as functions from "firebase-functions";
import {db, firestore} from "../firebase";
import {DocumentData} from "@google-cloud/firestore";

export const updateCloset = functions
    .region("asia-northeast1")
    .firestore.document("users/{userId}/status/{status}/closet/{clothesId}")
    .onUpdate(async (change) => {
      const afterData: DocumentData = change.after.data();
      const beforeData: DocumentData = change.before.data();

      // likedCount差分
      const incrementLikedCount: number =
      afterData.likedCount - beforeData.likedCount;

      // 購入額差分
      const incrementBuying: number = afterData.price - beforeData.price;

      // 売却額差分
      const incrementSelling: number = afterData.selling - beforeData.selling;

      console.log("updateClosetトリガー1");
      const statusRef = db
          .collection("users")
          .doc(afterData.uid)
          .collection("status")
          .doc("status");

      if (afterData.isSell !== beforeData.isSell) {
        let clothesCount = 0;
        const closetRef = db
            .collection("users")
            .doc(afterData.uid)
            .collection("status")
            .doc("status")
            .collection("closet")
            .where("isSell", "==", false);
        await closetRef.get().then((v) => {
          clothesCount = v.docs.length;
        });
        await statusRef.update({
          clothesCount: clothesCount,
        });
        console.log("clothesCount");
      } else if (afterData.likedCount !== beforeData.likedCount) {
        await statusRef.update({
          likedCount: firestore.FieldValue.increment(incrementLikedCount),
        });
        console.log("likedCount");
      } else if (afterData.price !== beforeData.price) {
        await statusRef.update({
          buying: firestore.FieldValue.increment(incrementBuying),
        });
        console.log("buying");
      } else if (afterData.selling !== beforeData.selling) {
        await statusRef.update({
          selling: firestore.FieldValue.increment(incrementSelling),
        });
        console.log("selling");
      }
      return Promise.resolve();
    });
