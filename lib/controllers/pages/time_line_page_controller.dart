import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_line_page_controller.freezed.dart';

@freezed
class TimeLinePageState with _$TimeLinePageState {
  const TimeLinePageState._();

  const factory TimeLinePageState(
      {@Default(<Clothes>[]) List<Clothes> timeLineList,
      @Default(false) bool isLoading,
      @Default(true) bool isAddClothes}) = _TimeLinePageState;
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
      _init();
    }
  }
  final Reader _read;
  final String _userId;

  Future<void> _init() async {
    final timeLineList =
        await _read(timeLineRepositoryProvider).fetchTimeLines(userId: _userId);
    state = state.copyWith(timeLineList: timeLineList);
  }

  Future<void> fetchTimeLine() async {
    final timeLineList =
        await _read(timeLineRepositoryProvider).fetchTimeLines(userId: _userId);
    state = state.copyWith(timeLineList: timeLineList);
  }

  Future<void> endScroll() async {
    state = state.copyWith(isLoading: true);
    final lastItemId = state.timeLineList.last.itemId;
    final addClothes = await _read(timeLineRepositoryProvider)
        .fetchAddTimeLines(userId: _userId, lastItemId: lastItemId);
    final timeLineList = state.timeLineList..addAll(addClothes);
    state = state.copyWith(timeLineList: timeLineList, isLoading: false);
  }
}
