import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_page_controller.freezed.dart';

@freezed
class TabPageState with _$TabPageState {
  const TabPageState._();

  const factory TabPageState({@Default('') String image}) = _TabPageState;
}

final tabPageProvider =
    StateNotifierProvider<TabPageController, TabPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return TabPageController(user);
});

class TabPageController extends StateNotifier<TabPageState> {
  TabPageController(this._user) : super(const TabPageState()) {
    fetchAccountImage();
  }

  final UserModel _user;

  Future<void> fetchAccountImage() async {
    state = state.copyWith(image: _user.image);
  }
}
