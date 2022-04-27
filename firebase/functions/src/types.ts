import firebase from "./firebase";

export interface Clothes {
  createdBuy: firebase.firestore.Timestamp;
  createdSell: firebase.firestore.Timestamp;
  itemId: string;
  brands: string;
  price: string;
  category: string;
  imageURL: string;
  selling: string;
  description: string;
  day: string;
  month: string;
  year: string;
  sellingDay: string;
  sellingMonth: string;
  sellingYear: string;
  isSell: string;
  isFavorite: string;
  uid: string;
  buyingForm: string;
}


