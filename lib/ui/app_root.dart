import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:singleton_pattern/config/api_config.dart';
import 'package:singleton_pattern/data/api/connectivity_service.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with Core, Components {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      showPerformanceOverlay: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      title: '<<YOUR-APP-RECENTS-TITLE-NAME>>',
      routes: routes,
      navigatorKey: rootNavKey,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: observers,
      builder: (context, child) {
        ///Error builder
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
