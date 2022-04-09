import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_page_controller.freezed.dart';

@freezed
class TimeLinePageState with _$TimeLinePageState {
  const TimeLinePageState._();

  const factory TimeLinePageState(
      {@Default(<Clothes, UserModel>{}) Map<Clothes, UserModel> logMap,
      @Default(false) bool isLoading,
      @Default(<Clothes>[]) List<Clothes> logList,
      @Default('') String lastItemId,
      @Default(true) bool isAddClothes,
      @Default(false) bool isScrollLoading,}) = _TimeLinePageState;
}

final timeLinePageProvider =
    StateNotifierProvider<TimeLinePageController, TimeLinePageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return TimeLinePageController(
    ref.read,
    userId: user.uid,
  );
});

class TimeLinePageController extends StateNotifier<TimeLinePageState> {
  TimeLinePageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(TimeLinePageState()) {
    if (_userId != '') {
      fetchTimeLine();
    }
  }
  final Reader _read;
  final String _userId;

  Future<void> fetchTimeLine() async {
    state = state.copyWith(isLoading: true);
    final logList = await _read(timeLineRepositoryProvider).fetchTimeLines();

    final logMap = {...state.logMap};
    for (var clothes in logList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        logMap..addAll({clothes: user});
      }
    }

    if (logList.isNotEmpty) {
      state = state.copyWith(
          logMap: logMap, isLoading: false, lastItemId: logList.last.itemId);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> pullToRefresh() async {
    //mapをリセット
    state = state.copyWith(logMap: {});
    fetchTimeLine();
  }

  Future<void> endScroll() async {
    state = state.copyWith(isScrollLoading: true);
    final lastItemId = state.lastItemId;
    final addLogList = await _read(timeLineRepositoryProvider)
        .fetchAddTimeLines(lastItemId: lastItemId);
    final logMap = {...state.logMap};
    for (var clothes in addLogList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        logMap..addAll({clothes: user});
      }
    }

    if (addLogList.length < 5) {
      state = state.copyWith(isAddClothes: false);
    }

    state = state.copyWith(logMap: logMap, isScrollLoading: false, lastItemId: addLogList.last.itemId);
  }
}
