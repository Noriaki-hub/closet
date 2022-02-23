
import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:closet_app_xxx/model/friends/models/friendsRequest_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../CustomExeption.dart';
import '../../User/models/user_model.dart';
import '../repositories/friends _repositories.dart';
import '../models/friends_model.dart';









final friendsListProvider = StateNotifierProvider<FriendsListController, AsyncValue<List<UserModel>>>(
        (ref) {
      final user = ref.watch(currentUserProvider);
      return FriendsListController(ref.read, user.uid);
    }
);

// 非同期でラップ
class FriendsListController extends StateNotifier<AsyncValue<List<UserModel>>> {
  final Reader _read;
  final String? _userId;

  FriendsListController(this._read, this._userId) : super(AsyncValue.loading()) {
    {
      retrieveItems();
    }
  }
  Future<void> retrieveItems({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(friendsRepositoryProvider).retrieveItems(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

}