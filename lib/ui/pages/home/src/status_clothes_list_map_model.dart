import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';

class StatusClothesListMapModel {
  StatusClothesListMapModel(this.clothesList, this.user);
  List<Clothes> clothesList;
  UserModel user;
}
