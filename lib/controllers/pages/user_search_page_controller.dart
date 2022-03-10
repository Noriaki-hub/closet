import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/user_search_page_repository.dart';


part 'user_search_page_controller.freezed.dart';

@freezed
class UserSearchPageState with _$UserSearchPageState {
  const UserSearchPageState._();

  const factory UserSearchPageState({
    @Default(<UserModel>[]) List<UserModel> searchedUsers,
    @Default('') String searchId,
  }) = _UserSearchPageState;

}



final UserSearchProvider =
StateNotifierProvider.autoDispose<UserSearchPageController, UserSearchPageState>(
        (ref) {
      return UserSearchPageController(ref.read);
    });


class UserSearchPageController extends StateNotifier<UserSearchPageState> {
  UserSearchPageController(this._read, )  : super(const UserSearchPageState()) {
    _init();
  }
  final Reader _read;

  Future<void> _init() async {

      fetchSearchedUsers();

  }

  Future<void> fetchSearchedUsers() async {
    if(state.searchId != '') {
      final List<UserModel> searchedUsers =
      await _read(searchUserRepositoryProvider).fetch(searchId: state.searchId);
      state = state.copyWith(
        searchedUsers: searchedUsers,
      );
    }
  }

  Future<void> changeSearchId({required String searchId}) async {
    if(searchId != '') {
      final List<UserModel> searchedUsers =
      await _read(searchUserRepositoryProvider).fetch(searchId: searchId);
      state = state.copyWith(
          searchId: searchId,
          searchedUsers: searchedUsers
      );
    }
  }
}