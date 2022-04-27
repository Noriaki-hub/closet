import * as CreateLike from "./trigger/create_like";
import * as DeleteLike from "./trigger/delete_like";
import * as UpdateClothes from "./trigger/update_clothes";
import * as CreateClothes from "./trigger/create_clothes";
import * as DeleteClothes from "./trigger/delete_clothes";
import * as UpdateCloset from "./trigger/update_closet";
import * as DeleteCloset from "./trigger/delete_closet";
import * as CreateCloset from "./trigger/create_closet";
import * as ScrapinfBrands from "./scraping/scrapingBrands";
import * as  BrandFollower from "./trigger/brand_follower";

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

// brands
export const incrementBrandFollower = BrandFollower.incrementBrandFollower;
export const decrementBrandFollower = BrandFollower.decrementBrandFollower;

// scraping
export const scrapingBrands = ScrapinfBrands.scrapingBrands;



