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
  /// Enables rainbow borders over every rebuilt widget
  /// during runtime, helpful to check where your app is expensive
  /// and where is room for improvement
  /// * can also be enabled via DevTools Widget Inspector
  debugRepaintRainbowEnabled = false;

  /// Enables widget properties layout in app UI
  /// during runtime, helpful to get overview of your app
  /// in terms of UI layout, padding, margin etc.
  /// and where is room for improvement
  /// * can also be enabled via DevTools Widget Inspector
  debugPaintSizeEnabled = false;

  /// Creates a zone around the application to catch error leaks
  /// and root level application crashes which are generally
  /// fatal crashes
  runZonedGuarded(
    () async {
      /// Ensures all the necessary hardware is attached to the framework
      /// before booting up the main application so there is zero to none
      /// chance of plugin(native integration) related crashes
      WidgetsFlutterBinding.ensureInitialized();

      /// Code level flavoring for separate API environments
      ApiConfig.i.init(flavour: Flavour.dev);

      /// Calls multiple futures in parallel
      await Future.wait(
        <Future>[
          /// To restrict [DeviceOrientation] in this
          /// application to portrait up only
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),

          /// Initializing hive database in local memory and
          /// registering model adaptors
          HiveConfig.init(),

          /// Initializing firebase services as well as local notifications
          FirebaseConfig.init(),

          /// Initializing connectivity listeners for server maintenance
          /// as well as device internet status
          ConnectivityService.i.init(),
        ],
      );

      /// Pass all uncaught errors from the framework to Crashlytics.
      if (kReleaseMode) {
        FlutterError.onError =
            FirebaseCrashlytics.instance.recordFlutterFatalError;
      }
      runApp(const MyApp());
    },
    (Object error, StackTrace stack) {
      debugPrintStack(stackTrace: stack, label: '[App Zone Stack Trace]>>');
      debugPrint(error.toString());

      /// Pass all fatal crashes from system to Crashlytics.
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    },
  );
}
