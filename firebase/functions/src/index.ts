import * as CreateLike from "./trigger/create_like";
import * as DeleteLike from "./trigger/delete_like";
import * as UpdateClothes from "./trigger/update_clothes";

export const incrementClothesLike = CreateLike.incrementClothesLike;
export const decrementClothesLike = DeleteLike.decrementClothesLike;
export const updateClothes = UpdateClothes.updateClothes;
