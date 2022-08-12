import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/ui/components/components.dart';

class ConnectivityService with Components {
  static final _singleton = ConnectivityService._();
  static ConnectivityService get i => _singleton;
  final serverStatus = ValueNotifier<ServerStatus>(ServerStatus());
  late StreamSubscription _internetListener;

  final _plugin = Connectivity();

  factory ConnectivityService() => _singleton;

  ConnectivityService._();

  void dispose() async => await _internetListener.cancel();

  Future<void> handleConnectivityResult(ConnectivityResult result) async {
    try {
      if (result == ConnectivityResult.wifi) {
        final res = await get(ApiConfig.i.baseUri).timeout(
          sec5,
          onTimeout: () => Response('', 0),
        );
        final bool status = res.statusCode != 0;
        updateStatus(isConnected: status, underMaintenance: !status);
        return;
      }

      updateStatus(
        isConnected: result != ConnectivityResult.none,
        underMaintenance: false,
      );
    } on SocketException catch (e) {
      updateStatus(
        isConnected: (e.osError?.errorCode ?? 7) == 7,
        underMaintenance: false,
      );
    } on TimeoutException catch (_) {
      updateStatus(isConnected: false, underMaintenance: true);
    }
  }

  Future<void> init() async {
    if (kIsWeb) {
      updateStatus(isConnected: true, underMaintenance: false);
    } else {
      final result = await _plugin.checkConnectivity();
      await handleConnectivityResult(result);
      _internetListener = _plugin.onConnectivityChanged.listen(
        handleConnectivityResult,
      );
    }
  }

  void updateStatus({
    bool underMaintenance = false,
    bool isConnected = false,
  }) {
    serverStatus.value = serverStatus.value
      ..underMaintenance = underMaintenance
      ..isConnected = isConnected;
  }
}

class ServerStatus {
  bool underMaintenance;
  bool isConnected;
  ServerStatus({
    this.isConnected = false,
    this.underMaintenance = false,
  });
}
