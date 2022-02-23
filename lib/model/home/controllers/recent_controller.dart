import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../models/clothes_model.dart';
import '../repositiries/clothes_repository.dart';

final recentListProvider = StateNotifierProvider<RecentListController, AsyncValue<List<Clothes>>>(
        (ref) {
      return RecentListController(ref.read, );
    }
);

class RecentListController extends StateNotifier<AsyncValue<List<Clothes>>> {
  final Reader _read;

  RecentListController(this._read) : super(AsyncValue.loading()) {
    fetchRecent();
  }

  Future<void> fetchRecent({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(clothesListRepositoryProvider)
          .recent();
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }
}