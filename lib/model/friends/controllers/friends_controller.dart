
import 'package:closet_app_xxx/model/auth/current_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../CustomExeption.dart';
import '../repositories/friends _repositories.dart';
import '../models/friends_model.dart';





final friendsListProvider = Provider<List<Friends>>((ref) {
  final itemListState = ref.watch(friendsListControllerProvider);
  return itemListState.maybeWhen(
    data: (friends) {
       return friends;
      },
    orElse: () => [],
  );
});


final friendsListExceptionProvider = StateProvider<CustomException?>((_) => null);

final friendsListControllerProvider = StateNotifierProvider<FriendsListController, AsyncValue<List<Friends>>>(
        (ref) {
      final user = ref.watch(currentUserProvider);
      return FriendsListController(ref.read, user.uid);
    }
);

// 非同期でラップ
class FriendsListController extends StateNotifier<AsyncValue<List<Friends>>> {
  final Reader _read;
  final String? _userId;

  // Readerとnull許可ユーザIDを受け取る
  FriendsListController(this._read, this._userId) : super(AsyncValue.loading()) {
    // ユーザIDがNULLでない場合、アイテムの取得をする
    if (_userId != null) {
      retrieveItems();
    }
  }

  // アイテムの取得
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