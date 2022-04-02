

import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../global/user_controller.dart';

part 'shop_log_page_controller.freezed.dart';
@freezed
class ShopLogPageState with _$ShopLogPageState {
  const ShopLogPageState._();

  const factory ShopLogPageState({
    @Default(<Share>[]) List<Share> timeLineList,
    @Default(false) bool isLoading,
    @Default(true) bool isAddClothes

  }) = _ShopLogPageState;

}


final ShopLogPageProvider =
StateNotifierProvider<ShopLogPageController, ShopLogPageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      return ShopLogPageController(ref.read, userId: user.uid, );
    });


class ShopLogPageController extends StateNotifier<ShopLogPageState> {
  ShopLogPageController(this._read,{required String userId,})  :
        _userId = userId, super(ShopLogPageState()){
    if(_userId != '') {
      _init();
    }
  }
  final Reader _read;
  final String _userId;

  Future<void> _init() async{
    final timeLineList = await _read(timeLineRepositoryProvider).fetchShares(userId: _userId, genre: 'shop');
    state = state.copyWith(timeLineList: timeLineList);
    if(timeLineList.length < 10){
      state = state.copyWith(isAddClothes: false);
    }
  }

  Future<void> fetchTimeLine() async {

    final timeLineList = await _read(timeLineRepositoryProvider).fetchShares(userId: _userId, genre: 'shop');
    state = state.copyWith(timeLineList: timeLineList);
  }

  Future<void> endScroll()async{
    state = state.copyWith(isLoading: true);
    final lastItemId = state.timeLineList.last.itemId;
    final addShares = await _read(timeLineRepositoryProvider).fetchAddShares(userId: _userId, lastItemId: lastItemId, genre: 'shop');
    final timeLineList = state.timeLineList..addAll(addShares);
    state = state.copyWith(timeLineList: timeLineList, isLoading: false);
  }
}