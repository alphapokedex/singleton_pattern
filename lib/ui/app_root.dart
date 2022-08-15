import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/data/api/connectivity_service.dart';
import 'package:singleton_pattern/data/model/model_export.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class MyApp extends StatefulWidget {
  /// [MyApp] is the root widget of the application
  /// [MaterialApp] where all named routes, observers,
  /// theme and major error builders are connected with
  /// each part of the application.
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with Core, Components {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Enables semantic borders on widgets with semantic behaviour enabled
      showSemanticsDebugger: false,

      /// Enables performance overlay graph for the application on runtime
      showPerformanceOverlay: false,

      /// Enables material grid over the app to assist pixel perfect alignment
      debugShowMaterialGrid: false,

      /// Enables debug banner on the top corner, useful in case of demo
      debugShowCheckedModeBanner: false,
      theme: theme,

      /// App title which will be shown in system recents screen on android/iOS
      title: '<<YOUR-APP-RECENTS-TITLE-NAME>>',

      /// App routes used in named route navigation
      routes: routes,

      /// Root Navigator key used to eleminate the usage of
      /// [BuildContext] in nested levels and uses the key
      /// to manipulate the [Navigator] stack based on [NavigationService]
      /// singleton class methods
      navigatorKey: rootNavKey,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: observers,
      builder: (context, child) {
        /// Error builder widget
        /// in production mode will show error text for user
        /// in dev environment will show error details to the tester
        if (kReleaseMode) {
          ErrorWidget.builder = (details) =>
              ApiConfig.i.isDevEnv ? Text(details.toString()) : errorText;
        }
        return ValueListenableBuilder<ServerStatus>(
          valueListenable: ConnectivityService.i.serverStatus,
          builder: (_, flag, widget) => flag.underMaintenance
              ? maintenance
              : flag.isConnected
                  ? widget!
                  : noInternet,
          child: MediaQuery(
            /// textScaleFactor makes sure the size of text
            /// throughout the app remains default irrespective
            /// of your system font size
            data: context.mq.copyWith(textScaleFactor: 1),
            child: child!,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    ConnectivityService.i.dispose();
    super.dispose();
  }
}
