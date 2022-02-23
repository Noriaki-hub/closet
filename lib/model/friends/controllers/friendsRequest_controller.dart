import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:closet_app_xxx/model/friends/models/friendsRequest_model.dart';
import 'package:closet_app_xxx/model/friends/repositories/friendsRequest_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../../User/models/user_model.dart';



final followProvider = StateNotifierProvider.autoDispose<FollowController, AsyncValue<List<FriendsRequest>>>(
        (ref) {
      return throw UnimplementedError();
    }
);

final followProviderFamily = StateNotifierProvider.family
    .autoDispose<FollowController, AsyncValue<List<FriendsRequest>>, String>(
        (ref, userId) {
          final user = ref.watch(currentUserProvider);
      return FollowController(ref.read, user, userId);
    });


class FollowController extends StateNotifier<AsyncValue<List<FriendsRequest>>> {
  final Reader _read;
  final UserModel user;
  final String userId;


  FollowController(this._read, this.user, this.userId) : super(AsyncValue.loading()){
    fetchSendRequest(userId);
  }

  Future<void> fetchSendRequest(String userId,{bool isRefreshing = false}) async{
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final myId = FriendsRequest(uid: user.uid);
      final yourId = FriendsRequest(uid: userId);
       final items = await _read(friendsRequestRepositoryProvider).fetch(
          myId: myId, yourId: yourId);

         state = AsyncValue.data(items..where((item) => item.uid == userId));


    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> sendRequest({required String uid}) async {
    try {
      final myId = FriendsRequest(uid: user.uid);
      final yourId = FriendsRequest(uid: uid);
      await _read(friendsRequestRepositoryProvider).add(myId: myId, yourId: yourId);
      state.whenData((items) => state = AsyncValue.data(items..add(myId)));
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> deleteSendRequest({required String uid} ) async{
    try {
      final myId = FriendsRequest(uid: user.uid);
      final yourId = FriendsRequest(uid: uid);
      await _read(friendsRequestRepositoryProvider).delete(
          myId: myId, yourId: yourId,);
      state.whenData((items) => state = AsyncValue.data(items..clear()));
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }
}