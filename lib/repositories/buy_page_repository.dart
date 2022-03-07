import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/clothes.dart';
import '../models/user.dart';


final buyRepositoryProvider = Provider<buyRepository>((ref) => buyRepository(ref.read));

class buyRepository {
  final Reader _read;

  const buyRepository(this._read);

  Future<void> add({required Clothes clothes, required UserModel user}) async {
      await _read(firebaseFirestoreProvider)
          .collection("users").doc(user.uid)
          .collection('clothes').add(clothes.toDocument());
  }
}