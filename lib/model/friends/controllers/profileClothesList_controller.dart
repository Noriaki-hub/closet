
import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/model/User/models/user_model.dart';
import 'package:closet_app_xxx/model/friends/models/profile_model.dart';
import 'package:closet_app_xxx/model/friends/repositories/profileClothesLIst_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';

final clothesListProvider = Provider<List<Profile>>((ref) {
  final itemListState = ref.watch(clothesListControllerProvider);
  return itemListState.maybeWhen(
    data: (items) {
      return items;
    },
    orElse: () => [],
  );
});



final clothesListControllerProvider = StateNotifierProvider<ClothesListController, AsyncValue<List<Profile>>>(
        (ref) {
      return ClothesListController(ref.read, uid);
    }
);

// 非同期でラップ
class ClothesListController extends StateNotifier<AsyncValue<List<Profile>>> {
  final Reader _read;
   String? _userId;

  // Readerとnull許可ユーザIDを受け取る
  ClothesListController(this._read, this._userId) : super(AsyncValue.loading()) {
    // ユーザIDがNULLでない場合、アイテムの取得をする

    if(_userId != null) {
      getClothesList(_userId);
    }

  }

  // アイテムの取得
  Future<void> getClothesList(String? _userId, {bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(clothesListRepositoryProvider)
          .retrieve(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

}