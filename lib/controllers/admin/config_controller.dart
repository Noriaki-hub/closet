import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_controller.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState({bool? isMaintenance}) = _ConfigState;
}

final configProvider =
    StateNotifierProvider<ConfigStateController, ConfigState>(
        (ref) => ConfigStateController());

class ConfigStateController extends StateNotifier<ConfigState> {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  ConfigStateController() : super(const ConfigState()) {
    maintenanceCheck();
  }

  Future<void> maintenanceCheck() async {
    await remoteConfig.fetchAndActivate();

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(hours: 1),
    ));

    final isMaintenance = remoteConfig.getBool('isMaintenance');
    state = state.copyWith(isMaintenance: isMaintenance);
  }
}
