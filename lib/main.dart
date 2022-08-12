import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/config/firebase_config.dart';
import 'package:singleton_pattern/config/hive_config.dart';
import 'package:singleton_pattern/data/api/connectivity_service.dart';
import 'package:singleton_pattern/ui/app_root.dart';
import 'package:singleton_pattern/utilities/core.dart';

void main() {
  debugRepaintRainbowEnabled = false;
  debugPaintSizeEnabled = false;
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      ApiConfig.i.init(flavour: Flavour.dev);
      await Future.wait(
        <Future>[
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
          HiveConfig.init(),
          FirebaseConfig.init(),
          ConnectivityService.i.init(),
        ],
      );

      // Pass all uncaught errors from the framework to Crashlytics.
      if (kReleaseMode) {
        FlutterError.onError =
            FirebaseCrashlytics.instance.recordFlutterFatalError;
      }
      runApp(const MyApp());
    },
    (Object error, StackTrace stack) {
      debugPrintStack(stackTrace: stack, label: '[App Zone Stack Trace]>>');
      debugPrint(error.toString());
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    },
  );
}
