
import 'package:closet_app_xxx/model/User/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../CustomExeption.dart';
import '../../auth/current/current_controller.dart';
import '../models/friends_model.dart';
import '../repositories/friendsAccept_repository.dart';
import '../repositories/friendsRequestedList_repository.dart';




final friendsRequestedListProvider = StateNotifierProvider<friendsRequestedListController, AsyncValue<List<Friends>>>(
        (ref) {
          final user = ref.watch(currentUserProvider);
          return friendsRequestedListController(ref.read, user);
        }
);


class friendsRequestedListController extends StateNotifier<AsyncValue<List<Friends>>> {

  final Reader _read;
  final UserModel user;

  friendsRequestedListController(this._read, this.user) : super(AsyncValue.loading()) {
    fetchList();
  }


  Future<void> fetchList( {bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(friendsRequestedRepositoryProvider).retrieveRequestedList();
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> addFriends({required String uid, required String image, required String name,}) async {
    try {
      final myModel = Friends(image: user.image, uid: user.uid, name: user.name);
      final yourModel = Friends(image: image, uid: uid, name: name);
      await _read(friendsAcceptRepositoryProvider).addFriends(userId: uid, my: myModel, your: yourModel);
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> deleteRequest({required String uid, required String image, required String name,}) async {
    try {
      final yourModel = Friends(image: image, uid: uid, name: name);
      await _read(friendsAcceptRepositoryProvider).deleteRequest(userId: yourModel.uid);
      state.whenData((items) => state = AsyncValue.data(items..removeWhere((item) => item.uid == yourModel.uid)));
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }
}