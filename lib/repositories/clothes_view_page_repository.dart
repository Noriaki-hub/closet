import 'package:closet_app_xxx/models/clothes_for_public.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/clothes.dart';


final clothesViewPageRepositoryProvider = Provider<Repository>((ref) => Repository(ref.read));

class Repository {
  final Reader _read;

  const Repository(this._read);

  Future<void> updateFavoriteTrue({ required String userId, required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes').doc(itemId)
        .update({
      'isFavorite' : true
    });

  }
  Future<void> updateFavoriteFalse({ required String userId, required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes').doc(itemId)
        .update({
      'isFavorite' : false
    });

  }
}