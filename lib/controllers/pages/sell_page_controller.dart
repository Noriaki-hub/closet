import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/sell.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_page_controller.freezed.dart';

@freezed
class SellPageState with _$SellPageState {
  const SellPageState._();

  const factory SellPageState({
    @Default(<Clothes>[]) List<Clothes> closet,
    @Default('') String selectClothesId,
    DateTime? selectedDate,
    Clothes? selectedClothes,
    @Default('') String selling,
    @Default('') String sellingDay,
    @Default('') String sellingMonth,
    @Default('') String sellingYear,
    @Default(false) bool isLoading,
  }) = _SellPageState;
}

final sellPageProvider =
    StateNotifierProvider.autoDispose<SellPageController, SellPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return SellPageController(
    ref.read,
    user.uid,
  );
});

class SellPageController extends StateNotifier<SellPageState> {
  SellPageController(
    this._read,
    this._userId,
  ) : super(SellPageState()) {
    fetchClothesList();
  }

  final Reader _read;
  final String _userId;

  Future<void> fetchClothesList() async {
    final closet = await _read(clothesRepositoryProvider)
        .fetchCloset(userId: _userId, category: 'ALL', isSell: false);
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

  Future<void> endScroll() async {
    state = state.copyWith(isLoading: true);
    final lastItemId = state.closet.last.itemId;
    final addClothes = await _read(clothesRepositoryProvider).fetchAddCloset(
        userId: _userId,
        lastItemId: lastItemId,
        category: 'ALL',
        isSell: false);
    final closet = state.closet..addAll(addClothes);
    state = state.copyWith(closet: closet, isLoading: false);
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
    await _read(clothesRepositoryProvider).sell(
      clothes: clothes,
      userId: _userId,
    );
  }
}
