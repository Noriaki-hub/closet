import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_log_page_controller.freezed.dart';

@freezed
class MediaLogPageState with _$MediaLogPageState {
  const MediaLogPageState._();

  const factory MediaLogPageState(
      {@Default(<Share>[]) List<Share> timeLineList,
      @Default(false) bool isLoading,
      @Default(true) bool isAddClothes}) = _MediaLogPageState;
}

final mediaLogPageProvider = StateNotifierProvider.autoDispose<
    MediaLogPageController, MediaLogPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return MediaLogPageController(
    ref.read,
    userId: user.uid,
  );
});

class MediaLogPageController extends StateNotifier<MediaLogPageState> {
  MediaLogPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(MediaLogPageState()) {
    if (_userId != '') {
      _init();
    }
  }
  final Reader _read;
  final String _userId;

  Future<void> _init() async {
    final timeLineList = await _read(timeLineRepositoryProvider)
        .fetchShares(userId: _userId, genre: 'media');
    state = state.copyWith(timeLineList: timeLineList);
  }

  Future<void> fetchTimeLine() async {
    final timeLineList = await _read(timeLineRepositoryProvider)
        .fetchShares(userId: _userId, genre: 'media');
    state = state.copyWith(timeLineList: timeLineList);
  }

  Future<void> endScroll() async {
    state = state.copyWith(isLoading: true);
    final lastItemId = state.timeLineList.last.itemId;
    final addShares = await _read(timeLineRepositoryProvider).fetchAddShares(
        userId: _userId, lastItemId: lastItemId, genre: 'media');
    final timeLineList = state.timeLineList..addAll(addShares);
    state = state.copyWith(timeLineList: timeLineList, isLoading: false);
  }
}
