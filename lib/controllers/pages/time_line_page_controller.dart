

import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../../models/user.dart';
import '../global/user_controller.dart';

part 'time_line_page_controller.freezed.dart';
@freezed
class TimeLinePageState with _$TimeLinePageState {
  const TimeLinePageState._();

  const factory TimeLinePageState({
   @Default(<Clothes>[]) List<Clothes> timeLineList,

  }) = _TimeLinePageState;

}


final TimeLinePageProvider =
StateNotifierProvider.autoDispose<TimeLinePageController, TimeLinePageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      return TimeLinePageController(ref.read, userId: user.uid, );
    });


class TimeLinePageController extends StateNotifier<TimeLinePageState> {
  TimeLinePageController(this._read,{required String userId,})  :
        _userId = userId, super(TimeLinePageState()){
    fetchTimeLine();
  }
  final Reader _read;
  final String _userId;



  Future<void> fetchTimeLine() async {

    final timeLineList = await _read(timeLineRepositoryProvider).fetchTimeLines(userId: _userId);


    state = state.copyWith(timeLineList: timeLineList);

  }


}