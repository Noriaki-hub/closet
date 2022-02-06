import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/model/User/models/user_model.dart';
import 'package:closet_app_xxx/model/friends/repositories/friendsRequest_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';



// final friendsRequestControllerProvider = StateNotifierProvider<friendsRequestController, User>(
//         (ref) {
//       return friendsRequestController(ref.read, uid);
//     }
// );
//
// // 非同期でラップ
// class friendsRequestController extends StateNotifier<AsyncValue<User>> {
//   friendsRequestController(AsyncValue<User> state) : super(state);
//
//
//
//
//   Future<void> sendRequest(String? _userId, {required String email, required String image, required String uid, required String name, required String id,}) async {
//     try {
//       final user = User(email: email, image: image, uid: uid, name: name, id: id);
//       final itemId = await _read(friendsRequestRepositoryProvider).add(
//         userId: _userId!,
//         user: user,
//       );
//       state.whenData((items) => state = AsyncValue.data(items..add(user.copyWith(id: itemId))));
//     } on CustomException catch (e) {
//       _read(itemListExceptionProvider).state = e;
//     }
//   }
// }