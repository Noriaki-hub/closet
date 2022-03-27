import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/media.dart';
import '../../repositories/media_page_repository.dart';
import '../global/user_controller.dart';

part 'media_page_controller.freezed.dart';

@freezed
class MediaPageState with _$MediaPageState {
  const MediaPageState._();

  const factory MediaPageState({
    @Default(<Media>[]) List<Media> medias
  }) = _MeidaPageState;

}


final MediaPageProvider =
StateNotifierProvider<MediaPageController, MediaPageState>(
        (ref) {
          final user = ref.watch(userProvider.select((value) => value.user));
      return MediaPageController(ref.read, userId: user.uid);
    });


class MediaPageController extends StateNotifier<MediaPageState> {
  MediaPageController(this._read, {required String userId, })  : _userId = userId, super(const MediaPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;

  Future<void> _init() async {
    fetchMedias();
  }

  Future<void> fetchMedias() async {
    final List<Media> medias =
    await _read(mediaRepositoryProvider).fetch(userId: _userId);
    state = state.copyWith(medias: medias);
  }

  Future<void> deleteMedia({required Media media}) async {
    await _read(mediaRepositoryProvider).delete(userId: _userId, media: media);
    fetchMedias();
  }
}
