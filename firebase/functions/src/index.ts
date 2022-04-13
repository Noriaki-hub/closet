import * as CreateLike from "./trigger/create_like";
import * as DeleteLike from "./trigger/delete_like";
import * as UpdateClothes from "./trigger/update_clothes";
import * as CreateClothes from "./trigger/create_clothes";
import * as DeleteClothes from "./trigger/delete_clothes";
import * as UpdateCloset from "./trigger/update_closet";
import * as DeleteCloset from "./trigger/delete_closet";
import * as CreateCloset from "./trigger/create_closet";

// like
export const incrementClothesLike = CreateLike.incrementClothesLike;
export const decrementClothesLike = DeleteLike.decrementClothesLike;

// clothes
export const updateClothes = UpdateClothes.updateClothes;
export const createClothes = CreateClothes.createClothes;
export const deleteClothes = DeleteClothes.deleteClothes;

// closet
export const updateCloset = UpdateCloset.updateCloset;
export const createCloset = CreateCloset.createCloset;
export const deleteCloset = DeleteCloset.deleteCloset;

