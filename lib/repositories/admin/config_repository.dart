import 'package:closet_app_xxx/models/app_config.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final configRepositoryProvider =
    Provider<ConfigRepository>((ref) => ConfigRepository(ref.read));

class ConfigRepository {
  final Reader _read;

  const ConfigRepository(this._read);

 Future<AppConfig> fetchConfigs() async {
    final docSnapshot = await _read(firebaseFirestoreProvider).collection('config').doc('config2').get();
    final data = docSnapshot.data();
    if (data == null) {
      return const AppConfig();
    }
    return AppConfig.fromJson(data);
  }
}
