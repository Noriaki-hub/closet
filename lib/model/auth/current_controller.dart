
import 'package:closet_app_xxx/model/User/models/user_model.dart';
import 'package:closet_app_xxx/model/friends/repositories/friends_search_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../CustomExeption.dart';
import 'current_repository.dart';



final currentUserProvider = Provider<User>((ref) {
  final itemListState = ref.watch(currentUserControllerProvider);
  return itemListState.maybeWhen(
    data: (user) {
      return user;
    },
    orElse: () => User(email: '', image: '', uid: '', name: '', id: ''),
  );
});


final currentUserControllerProvider = StateNotifierProvider<currentUserController, AsyncValue<User>>(
        (ref) => currentUserController(ref.read,  )
);


class currentUserController extends StateNotifier<AsyncValue<User>> {
  String? searchedId;
  final Reader _read;

  currentUserController(this._read,  ) : super(AsyncValue.loading()){
    getSearchUser();
  }


  Future<void> getSearchUser({bool isRefreshing = false}) async {

    if (isRefreshing) state = AsyncValue.loading();
    try {
      final user = await _read(currentUserRepositoryProvider).retrieve();
      if (mounted) {
        state = AsyncValue.data(user);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }
}