import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'config_controller.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState({bool? isMaintenance, bool? isUpdateCheck}) =
      _ConfigState;
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

    final info = await PackageInfo.fromPlatform();
    String version = info.version;

    final doc = await FirebaseFirestore.instance
        .collection('config')
        .doc('config')
        .get();

    String newVersion =
        doc.data()!['ios_force_app_version'] as String;

    if (version != newVersion) {
      state = state.copyWith(isUpdateCheck: true);
    } else {
      state = state.copyWith(isUpdateCheck: false);
    }

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(hours: 1),
    ));

    final isMaintenance = remoteConfig.getBool('isMaintenance');
    state = state.copyWith(isMaintenance: isMaintenance);
  }
}
