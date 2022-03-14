import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../../models/sell.dart';
import '../../repositories/clothes_repository.dart';
import '../global/user_controller.dart';


part 'sell_page_controller.freezed.dart';

@freezed
class SellPageState with _$SellPageState {
  const SellPageState._();

  const factory SellPageState({
    @Default(<Clothes>[]) List<Clothes> closet,
    @Default('') String selectClothesId,
    DateTime? selectedDate,
    Clothes? selectedClothes,
    @Default('')String selling,
    @Default('')String sellingDay,
    @Default('')String sellingMonth,
    @Default('')String sellingYear,
  }) = _SellPageState;

}



final SellPageProvider =
StateNotifierProvider.autoDispose<SellPageController, SellPageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      // final calendarPickedDate = ref.watch(CalendarPickerProvider);
      return SellPageController(ref.read, user.uid,);
    });


class SellPageController extends StateNotifier<SellPageState> {
  SellPageController(this._read, this._userId, )
      : super(SellPageState()){
    fetchClothesList();
  }

  final Reader _read;
  final String _userId;




  Future<void> fetchClothesList() async {
    final closet = await _read(clothesRepositoryProvider).fetchCloset(userId: _userId, category: 'ALL', isSell: false);
    state = state.copyWith(
        closet: closet,
    );
  }

  Future<void> selectClothes({required Clothes clothes}) async {
    state = state.copyWith(selectedClothes: clothes);
  }

  Future<void> selling({required String selling}) async {
    state = state.copyWith(selling: selling);
  }

  Future<void> selectDate({required DateTime selectedDate}) async {
    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');
    state = state.copyWith(selectedDate: selectedDate);

    state = state.copyWith(sellingYear: yearFormat.format(selectedDate));

    state = state.copyWith(sellingMonth: monthFormat.format(selectedDate));

    state = state.copyWith(sellingDay: dayFormat.format(selectedDate));
  }




  Future<void> sellClothes() async {
    final clothes = Sell(
        itemId: state.selectedClothes!.itemId,
        selling: state.selling,
        sellingDay: state.sellingDay,
        sellingMonth: state.sellingMonth,
        sellingYear: state.sellingYear,
        isSell: true,
        createdSell: state.selectedDate!,
    );
    await _read(clothesRepositoryProvider).sell(clothes: clothes, userId: _userId,);
  }
}
