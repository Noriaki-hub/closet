import * as functions from "firebase-functions";
import {db, firestore} from "../firebase";
import {DocumentData} from "@google-cloud/firestore";

export const incrementClothesLike = functions
    .region("asia-northeast1")
    .firestore.document("clothes/{clothesId}/like/{likeId}")
    .onCreate(async (snapshot) => {
      const data: DocumentData = snapshot.data();
      if (data === null) return;

      await incrementLikedCount(data);
      return Promise.resolve();
    });

// likedCountにインクリメント
const incrementLikedCount = async (data: DocumentData) => {
  const clothesId = data.clothesId;

  const clothesRef = db
      .collection("clothes")
      .doc(clothesId);

  await clothesRef.update({
    likedCount: firestore.FieldValue.increment(1),
  });
  console.log("いいねトリガー");
};
