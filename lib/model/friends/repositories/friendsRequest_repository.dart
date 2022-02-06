// import 'package:closet_app_xxx/model/User/models/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../CustomExeption.dart';
// import '../../Firebase_providers.dart';
// abstract class _BaseItemRepository {
//
//   Future add({required String userId, required User user});
// }
//
//
// final friendsRequestRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

// class _ItemRepository implements _BaseItemRepository {
//   final Reader _read;
//
//   const _ItemRepository(this._read);
//
//     @override
//     Future add({required String userId, required User user}) async {
//       try {
//         // UserIdに紐付けてアイテムを登録
//         await _read(firebaseFirestoreProvider)
//             .collection('users').doc(userId).collection('getRequest')
//             .add(user.toDocument());
//
//       } on FirebaseException catch (e) {
//         throw CustomException(message: e.message);
//       }
//     }
//   }









