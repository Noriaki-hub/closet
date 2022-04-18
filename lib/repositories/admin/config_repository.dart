import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/models/app_config.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/notice.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final configRepositoryProvider =
    Provider<ConfigRepository>((ref) => ConfigRepository(ref.read));

class ConfigRepository {
  final Reader _read;

  const ConfigRepository(this._read);

  Future<AppConfig> fetchConfigs() async {
    final docSnapshot = await _read(firebaseFirestoreProvider)
        .collection('config')
        .doc('config2')
        .get();
    final data = docSnapshot.data();
    if (data == null) {
      return const AppConfig();
    }
    return AppConfig.fromJson(data);
  }

  Future<void> addNotice({required String title}) async {
    final date = _read(dateNowProvider);
    final dateString = date.year + '/' + date.month + '/' + date.day;
    final docSnapshot = _read(firebaseFirestoreProvider).collection('notice');
    final id = docSnapshot.doc().id;
    final notice =
        Notice(created: DateTime.now(), title: title, date: dateString, itemId: id, image: 'https://firebasestorage.googleapis.com/v0/b/clothes-app-3c8e3.appspot.com/o/IMG_2994.JPG?alt=media&token=8a938010-8df9-4ecd-aa8d-352294aa8c60');
    await _read(firebaseFirestoreProvider).collection('notice').doc(id).set({
      ...notice.toJson()
    });
  }
}
