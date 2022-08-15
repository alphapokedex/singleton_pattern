import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/data/model/model_export.dart';
import 'package:singleton_pattern/ui/components/components.dart';

class ConnectivityService with Components {
  /// Singleton for [ConnectivityService] class
  ConnectivityService._();
  static final _singleton = ConnectivityService._();
  factory ConnectivityService() => _singleton;
  static ConnectivityService get i => _singleton;

  /// [ValueNotifier] for server status values
  final serverStatus = ValueNotifier<ServerStatus>(ServerStatus());

  /// Connectivity plugin instance
  final _plugin = Connectivity();

  /// late initialized stream subscription for internet connectivity changes
  late StreamSubscription _internetListener;

  /// dispose listener for connectivity service
  void dispose() async => await _internetListener.cancel();

  /// [ConnectivityResult] handler mainly for connectivity
  /// change stream subscription
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

  /// Initialize server status values and listener for connectivity changes
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

  /// Method to update current server status values
  void updateStatus({
    bool underMaintenance = false,
    bool isConnected = false,
  }) {
    serverStatus.value = serverStatus.value
      ..underMaintenance = underMaintenance
      ..isConnected = isConnected;
  }
}
