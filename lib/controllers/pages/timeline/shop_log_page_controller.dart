import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_log_page_controller.freezed.dart';

@freezed
class ShopLogPageState with _$ShopLogPageState {
  const ShopLogPageState._();

  const factory ShopLogPageState(
      {@Default(<Share, UserModel>{}) Map<Share, UserModel> logMap,
      @Default(false) bool isLoading,
      @Default(<Share>[]) List<Share> logList,
      @Default(false) bool isScrollLoading,
      @Default('') String lastItemId,
      @Default(true) bool isAddClothes}) = _ShopLogPageState;
}

final shopLogPageProvider =
    StateNotifierProvider.autoDispose<ShopLogPageController, ShopLogPageState>(
        (ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return ShopLogPageController(
    ref.read,
    userId: user.uid,
  );
});

class ShopLogPageController extends StateNotifier<ShopLogPageState> {
  ShopLogPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(ShopLogPageState()) {
    if (_userId != '') {
      fetchTimeLine();
    }
  }
  final Reader _read;
  final String _userId;

  Future<void> fetchTimeLine() async {
    state = state.copyWith(isLoading: true);
    final logList = await _read(timeLineRepositoryProvider).fetchShares(
      genre: 'shop',
    );

    final logMap = {...state.logMap};
    for (var share in logList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: share.uid);
      if (user != null) {
        logMap..addAll({share: user});
      }
    }

    if (logList.isNotEmpty) {
      state = state.copyWith(
          logMap: logMap, isLoading: false, lastItemId: logList.last.itemId);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> endScroll() async {
    state = state.copyWith(isScrollLoading: true);
    final lastItemId = state.lastItemId;
    final addLogList = await _read(timeLineRepositoryProvider)
        .fetchAddShares(lastItemId: lastItemId, genre: 'shop');
    final logMap = {...state.logMap};
    for (var share in addLogList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: share.uid);
      if (user != null) {
        logMap..addAll({share: user});
      }
    }

    if (addLogList.length < 12) {
      state = state.copyWith(isAddClothes: false);
    }
    state = state.copyWith(logMap: logMap, isScrollLoading: false);
  }
}
