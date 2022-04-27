import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/repositories/develop/develop_repository.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//開発用
class DevelopPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              ref.read(developRepositoryProvider).addUserStatusAllClothes();
            },
            child: Text('done'),
          ),
          OutlinedButton(
              onPressed: () async {
                List<int> startNumberList = [
                  1653
                  // 1,
                  // 101,
                  // 201,
                  // 301,
                  // 401,
                  // 501,
                  // 601,
                  // 701,
                  // 801,
                  // 901,
                  // 1001,
                  // 1101,
                  // 1201,
                  // 1301,
                  // 1401,
                  // 1501,
                  // 1601,
                  // 1701,
                  // 1801,
                  // 1901,
                  // 2001,
                  // 2101,
                  // 2201,
                  // 2301,
                  // 2401,
                  // 2501,
                  // 2601,
                  // 2701,
                  // 2801,
                  // 2901,
                  // 3001,
                  // 3101,
                  // 3201,
                  // 3301,
                  // 3401,
                  // 3501,
                  // 3601,
                  // 3701,
                  // 3801,
                  // 3901,
                  // 4001,
                  // 4101,
                  // 4201,
                  // 4301,
                  // 4401,
                  // 4501,
                  // 4601,
                  // 4701,
                  // 4801,
                  // 4901,
                  // 5001,
                  // 5101,
                  // 5201,
                  // 5301,
                  // 5401,
                  // 5501,
                  // 5601,
                  // 5701,
                ];
                for (var startNumber in startNumberList) {
                  final functions = FirebaseFunctions.instanceFor(
                      app: Firebase.app(), region: 'asia-northeast1');
                  final callable = functions.httpsCallable('scrapingBrands');
                  callable({"startNumber": startNumber, 'getNumber': 46});
                }
              },
              child: Text('brands scraping')),
          OutlinedButton(
            onPressed: () async {
              final snap = await ref
                  .read(firebaseFirestoreProvider)
                  .collection('brands')
                  .get();
              final list =
                  snap.docs.map((doc) => Brand.fromJson(doc.data())).toList();

              final newList = [];
              list.forEach((element) {
                newList.add(element.toJson());
              });

              await ref
                  .read(firebaseFirestoreProvider)
                  .collection('record')
                  .doc('0')
                  .set({'brandList': newList});
            },
            child: Text('make brandList'),
          ),
        ],
      )),
    );
  }
}
