
import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/model/friends/models/friends_search_model.dart';
import 'package:closet_app_xxx/model/friends/repositories/friends_search_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../CustomExeption.dart';



final filteredUserListProvider = Provider<List<FriendsSearch>>((ref) {
  final itemListState = ref.watch(searchUserListControllerProvider);
  return itemListState.maybeWhen(
    data: (searches) {
      return searches;
      },
    orElse: () => [],
  );
});


final searchUserListControllerProvider = StateNotifierProvider<SearchUserController, AsyncValue<List<FriendsSearch>>>(
        (ref) => SearchUserController(ref.read,  searchedId)
);


class SearchUserController extends StateNotifier<AsyncValue<List<FriendsSearch>>> {
    String? searchedId;
  final Reader _read;

  SearchUserController(this._read,  this.searchedId) :  super(AsyncValue.loading()) {
    if(searchedId != null) {
      getSearchUser(searchedId);
    }else{
      searchedId = '';
      getSearchUser(searchedId);
    }

  }


  Future<void> getSearchUser(String? id, {bool isRefreshing = false}) async {

    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(searchUserRepositoryProvider).retrieve(
          id: id!);
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }
}