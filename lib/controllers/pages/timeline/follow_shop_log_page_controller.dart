import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_shop_log_page_controller.freezed.dart';

@freezed
class FollowShopLogPageState with _$FollowShopLogPageState {
  const FollowShopLogPageState._();

  const factory FollowShopLogPageState(
      {@Default(<Share, UserModel>{}) Map<Share, UserModel> logMap,
      @Default(false) bool isLoading,
      @Default(<Share>[]) List<Share> logList,
      @Default('') String lastItemId,
      @Default(true) bool isAddClothes}) = _FollowShopLogPageState;
}

final followShopLogPageProvider = StateNotifierProvider.autoDispose<
    FollowShopLogPageController, FollowShopLogPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return FollowShopLogPageController(
    ref.read,
    userId: user.uid,
  );
});

class FollowShopLogPageController
    extends StateNotifier<FollowShopLogPageState> {
  FollowShopLogPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(FollowShopLogPageState()) {
    if (_userId != '') {
      _init();
    }
  }
  final Reader _read;
  final String _userId;

  Future<void> _init() async {
    state = state.copyWith(isLoading: true);
    final logList = await _read(timeLineRepositoryProvider)
        .fetchFollowShares(genre: 'shop', userId: _userId);

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

  Future<void> fetchTimeLine() async {
    state = state.copyWith(isLoading: true);
    final logList = await _read(timeLineRepositoryProvider)
        .fetchFollowShares(genre: 'shop', userId: _userId);

    final logMap = {...state.logMap};
    for (var share in logList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: share.uid);
      if (user != null) {
        logMap..addAll({share: user});
      }
    }

    state = state.copyWith(
        logMap: logMap, isLoading: false, lastItemId: logList.last.itemId);
  }

  Future<void> endScroll() async {
    state = state.copyWith(isLoading: true);
    final lastItemId = state.lastItemId;
    final addLogList = await _read(timeLineRepositoryProvider)
        .fetchAddFollowShares(
            lastItemId: lastItemId, genre: 'shop', userId: _userId);
    final logMap = {...state.logMap};
    for (var share in addLogList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: share.uid);
      if (user != null) {
        logMap..addAll({share: user});
      }
    }
    state = state.copyWith(logMap: logMap, isLoading: false);
  }
}
