import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_media_log_page_controller.freezed.dart';

@freezed
class FollowMediaLogPageState with _$FollowMediaLogPageState {
  const FollowMediaLogPageState._();

  const factory FollowMediaLogPageState(
      {@Default(<Share, UserModel>{}) Map<Share, UserModel> logMap,
      @Default(false) bool isLoading,
      @Default(<Share>[]) List<Share> logList,
      @Default('') String lastItemId,
      @Default(false) bool isScrollLoading,
      @Default(true) bool isAddClothes}) = _FollowMediaLogPageState;
}

final followMediaLogPageProvider = StateNotifierProvider.autoDispose<
    FollowMediaLogPageController, FollowMediaLogPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return FollowMediaLogPageController(
    ref.read,
    userId: user.uid,
  );
});

class FollowMediaLogPageController extends StateNotifier<FollowMediaLogPageState> {
  FollowMediaLogPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(FollowMediaLogPageState()) {
    if (_userId != '') {
      _init();
    }
  }
  final Reader _read;
  final String _userId;

  Future<void> _init() async {
    state = state.copyWith(isLoading: true);
    final logList = await _read(timeLineRepositoryProvider).fetchFollowShares(genre: 'media', userId: _userId );

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
    final logList = await _read(timeLineRepositoryProvider).fetchFollowShares(genre: 'media', userId: _userId );

    final logMap = {...state.logMap};
    for (var share in logList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: share.uid);
      if (user != null) {
        logMap..addAll({share: user});
      }
    }

    state = state.copyWith(logMap: logMap,isLoading: false, lastItemId: logList.last.itemId);
  }

  Future<void> endScroll() async {
    state = state.copyWith(isScrollLoading: true);
    final lastItemId = state.lastItemId;
    final addLogList = await _read(timeLineRepositoryProvider)
        .fetchAddFollowShares(lastItemId: lastItemId, genre: 'media', userId: _userId);
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
