import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/repositories/share_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

part 'share_log_page_controller.freezed.dart';

@freezed
class ShareLogPageState with _$ShareLogPageState {
  const ShareLogPageState._();

  const factory ShareLogPageState(
      {@Default('') String currentUrl,
      @Default(Share()) Share share,
      String? title,
      String? image,
      String? description,
      String? url,
      @Default('') String genre}) = _ShareLogPageState;
}

class ShareLogPageProviderArg {
  ShareLogPageProviderArg({required this.currentUrl, required this.genre});
  final String currentUrl;
  final String genre;
}

final shareLogPageProvider = StateNotifierProvider.autoDispose<
    ShareLogPageController, ShareLogPageState>((ref) {
  return throw UnimplementedError();
});

final shareLogPageProviderFamily = StateNotifierProvider.family.autoDispose<
    ShareLogPageController,
    ShareLogPageState,
    ShareLogPageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return ShareLogPageController(ref.read,
      currentUrl: arg.currentUrl, userId: user.uid, genre: arg.genre);
});

class ShareLogPageController extends StateNotifier<ShareLogPageState> {
  ShareLogPageController(this._read,
      {required String currentUrl,
      required String userId,
      required String genre})
      : _currentUrl = currentUrl,
        _userId = userId,
        _genre = genre,
        super(ShareLogPageState()) {
    _init();
  }
  final Reader _read;
  final String _currentUrl;
  final String _genre;
  final String _userId;
  final String nullImage = 'https://firebasestorage.googleapis.com/v0/b/clothes-app-3c8e3.appspot.com/o/IMG_2994.JPG?alt=media&token=8a938010-8df9-4ecd-aa8d-352294aa8c60';

  Future<void> _init() async {
    var data = await MetadataFetch.extract(_currentUrl);
    if (data != null) {
      state = state.copyWith(
          title: data.title, image: data.image ?? nullImage, url: data.url);
    }
  }

  Future<void> addShare() async {
    final share = Share(
        url: state.url ?? '',
        uid: _userId,
        genre: _genre,
        title: state.title ?? '',
        image: state.image ??
            nullImage);

    await _read(shareRepositoryProvider).add(share: share);
  }
}
