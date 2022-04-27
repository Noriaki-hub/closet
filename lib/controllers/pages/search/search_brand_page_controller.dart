import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/brand.dart';

import 'package:closet_app_xxx/repositories/brand_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_brand_page_controller.freezed.dart';

@freezed
class SearchBrandPageState with _$SearchBrandPageState {
  const SearchBrandPageState._();

  const factory SearchBrandPageState(
      {@Default(<Brand>[]) List<Brand> brandList,
      @Default(<Brand>[]) List<Brand> searchedBrandList,

      @Default([]) List<String> searchWords,
      @Default('') formText}) = _SearchBrandPageState;
}

final searchBrandPageProvider =
    StateNotifierProvider<SearchBrandPageController, SearchBrandPageState>(
        (ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return SearchBrandPageController(
    ref.read,
    userId: user.uid,
  );
});

class SearchBrandPageController extends StateNotifier<SearchBrandPageState> {
  SearchBrandPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(const SearchBrandPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;

  final TextEditingController textFieldController = TextEditingController();

  Future<void> _init() async {
    fetchBrandList();
  }

  Future<void> fetchBrandList() async {
    final brandList = await _read(brandRepositoryProvider)
        .fetchBrandList(searchWords: state.searchWords);
    state = state.copyWith(brandList: brandList);
  }

  Future<void> changeSearchWords({required String brandName}) async {
    final brandList = state.brandList;
    var searchedBrandList = brandList.where((brand) =>
        brand.brand_name_ja.contains(brandName) ||
        brand.brand_name_en.contains(brandName)).toList();
    

    state = state.copyWith(searchedBrandList: searchedBrandList);
  }
}
