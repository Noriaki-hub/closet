import 'dart:io';

import 'package:closet_app_xxx/models/app_config.dart';
import 'package:closet_app_xxx/repositories/admin/config_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'config_controller.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState(
      {bool? isMaintenance,
      bool? isUpdateCheck,
      @Default(AppConfig()) AppConfig appConfig}) = _ConfigState;
}

final configProvider =
    StateNotifierProvider<ConfigStateController, ConfigState>(
        (ref) => ConfigStateController(ref.read));

class ConfigStateController extends StateNotifier<ConfigState> {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  ConfigStateController(this._read) : super(const ConfigState()) {
    _init();
  }

  Reader _read;

  Future<void> _init() async {
    await maintenanceCheck();
    updateCheck();
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

  Future<void> updateCheck() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String buildNumber = packageInfo.buildNumber;
    final appConfig = await _read(configRepositoryProvider).fetchConfigs();
    state = state.copyWith(appConfig: appConfig, isUpdateCheck: false);
    try {
      if (Platform.isIOS) {
        if (int.parse(buildNumber) < state.appConfig.minBuildNumberIos) {
          state = state.copyWith(isUpdateCheck: true);
        }
      } else if (Platform.isAndroid) {
        if (int.parse(buildNumber) < state.appConfig.minBuildNumberAndroid) {
          state = state.copyWith(isUpdateCheck: true);
        }
      }
    } catch (_) {}
  }
}
