part of 'core.dart';

class _Routes {
  factory _Routes() => _singleton;

  _Routes._();

  static final _Routes _singleton = _Routes._();

  final _rootNavigationKey = GlobalKey<NavigatorState>();

  static _Routes get instance => _Routes();

  GlobalKey<NavigatorState> get rootNavKey => _rootNavigationKey;

  static List<NavigatorObserver> get observers => [_RouteObserver()];

  static RouteFunction get appRoutes => {
        MaintenanceView.routeName: (_) => const MaintenanceView(),
        InternetErrorView.routeName: (_) => const InternetErrorView(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// Constructor use case in named routes to pass
      /// arguments efficiently and DRY way
      /// ```
      /// case PostDetailView.routeName:
      ///   final postId = settings.arguments as String;
      ///   return MaterialPageRoute(
      ///     builder: (_) => PostDetailView(postId: postId),
      ///   );
      /// ```
      default:
        return MaterialPageRoute(
          builder: (_) => const PageNotFoundView(),
        );
    }
  }
}

class _RouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      log(
        previousRoute.settings.name.toString(),
        name: '[Push from path ->]',
      );
    }
    log(
      route.settings.name.toString(),
      name: '[Push to path ->]',
    );
    if (route.settings.arguments != null) {
      log(
        route.settings.arguments.toString(),
        name: '[Push arguments passed ->]',
      );
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      log(
        previousRoute.settings.name.toString(),
        name: '[pop from path ->]',
      );
    }
    log(
      route.settings.name.toString(),
      name: '[pop to path ->]',
    );
    if (route.settings.arguments != null) {
      log(
        route.settings.arguments.toString(),
        name: '[pop arguments passed ->]',
      );
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      log(
        previousRoute.settings.name.toString(),
        name: '[remove from path ->]',
      );
    }
    log(
      route.settings.name.toString(),
      name: '[remove to path ->]',
    );
    if (route.settings.arguments != null) {
      log(
        route.settings.arguments.toString(),
        name: '[remove arguments passed ->]',
      );
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (oldRoute != null) {
      log(
        oldRoute.settings.name.toString(),
        name: '[replace from path ->]',
      );
    }
    if (newRoute != null) {
      log(
        newRoute.settings.name.toString(),
        name: '[replace to path ->]',
      );
      if (newRoute.settings.arguments != null) {
        log(
          newRoute.settings.arguments.toString(),
          name: '[replace arguments passed ->]',
        );
      }
    }
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    if (previousRoute != null) {
      log(
        previousRoute.settings.name.toString(),
        name: '[pop from path ->]',
      );
    }
    log(
      route.settings.name.toString(),
      name: '[pop to path ->]',
    );
    if (route.settings.arguments != null) {
      log(
        route.settings.arguments.toString(),
        name: '[pop arguments passed ->]',
      );
    }
  }

  @override
  void didStopUserGesture() {}
}

class NavigationService with Core, Components {
  final _navKey = _Routes.instance.rootNavKey;

  BuildContext get currentContext => _navKey.currentContext!;

  void keyCheck() {
    if (_navKey.currentState == null) return;
    if (_navKey.currentContext == null) return;
  }

  void showLoader() {
    keyCheck();
    _navKey.currentState?.push(
      DialogRoute(
        context: _navKey.currentContext!,
        barrierDismissible: false,
        useSafeArea: true,
        barrierColor: primaryColorLighter.withOpacity(0.2),
        builder: (_) => dialogLoader,
      ),
    );
  }

  void hideLoader() {
    keyCheck();
    pop();
  }

  void hideKeyboard() {
    keyCheck();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void snackBar(String? msg, bool isError) {
    keyCheck();
    ScaffoldMessengerState state = ScaffoldMessenger.of(
      _navKey.currentContext!,
    );

    state
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: isError ? redLighter : primaryColorLighter,
          content: Text(
            msg ?? UiString.error,
            style: roboto700.copyWith(
              fontSize: 18,
              color: isError ? red : primaryColorDark,
            ),
          ),
          duration: sec5,
        ),
      );
  }

  bool get canPop => _navKey.currentState?.canPop() ?? false;

  Future<T?> push<T>(String routeName, {Object? arguments}) async {
    keyCheck();
    return await _navKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> replace<T>(String routeName, {Object? arguments}) async {
    keyCheck();
    return await _navKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> replaceUntil<T>(String routeName, {Object? arguments}) async {
    keyCheck();
    popUntilRoot();
    return await push<T>(routeName, arguments: arguments);
  }

  void pop([dynamic value]) {
    keyCheck();
    if (_navKey.currentState?.canPop() ?? false) {
      _navKey.currentState?.pop(value);
    }
  }

  void popUntil(String routeName) {
    keyCheck();
    _navKey.currentState?.popUntil(
      ModalRoute.withName(routeName),
    );
  }

  void popUntilRoot() {
    keyCheck();
    _navKey.currentState?.popUntil(
      (route) => route.isFirst && route.isCurrent && route.isActive,
    );
  }

  void systemPop() async {
    keyCheck();
    await SystemNavigator.pop();
  }
}
