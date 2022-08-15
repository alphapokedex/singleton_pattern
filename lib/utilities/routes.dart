part of 'core.dart';

/// Hiden routes class only for method definitions
class _Routes {
  _Routes._();
  static final _Routes _singleton = _Routes._();
  factory _Routes() => _singleton;

  /// Private routes class instance getter for
  /// all files inclusive of part directive
  static _Routes get instance => _Routes();

  /// Root navigator key used in [NavigationService]
  final _rootNavigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get rootNavKey => _rootNavigationKey;

  /// Getter for List of route observer instances
  static List<NavigatorObserver> get observers => [_RouteObserver()];

  /// Getter for app routes mapped out for named route navigation
  static RouteFunction get appRoutes => {
        MaintenanceView.routeName: (_) => const MaintenanceView(),
        InternetErrorView.routeName: (_) => const InternetErrorView(),
      };

  /// [onGenerateRoute] method comes in handy for reducing constructor data
  /// passing in case where constructor arguments become necessary to use
  /// as well as for 404 page not found error handling
  ///
  /// There are many use cases but above mentioned use cases are more common
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

/// Route observer class to log out which route was in stack
/// and which is the new route pushed or replaced
///
/// What arguments were passed while route change
/// and what routes were poped
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
  /// private navigator key instance
  final _navKey = _Routes.instance.rootNavKey;

  /// [ValueKey] for loader to prevent unsyncronized pop of
  /// unknown widget from the tree
  static const loaderValueKey = ValueKey('dialogLoaderKey');

  /// Guard clause preventative checks on [BuildContext] & [NavigatorState]
  /// so any [NavigationService] method is not called unnecessarily when
  /// there is no proper [BuildContext] at any given moment in application
  /// or [NULL] [NavigatorState]
  void keyCheck() {
    if (_navKey.currentState == null) return;
    if (_navKey.currentContext == null) return;
  }

  /// Shows loader dialog over the UI and blocks any
  /// further action from the user
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

  /// Pops the last route from the screen whenever called
  /// NOTE: Must only be called syncronously after [showLoader]. Not before!
  void hideLoader() {
    keyCheck();
    final key = _navKey.currentWidget?.key;
    if (key == null || key is! ValueKey) return;
    if (key.value == loaderValueKey.value) pop();
  }

  /// Hides the keyboard whenever called
  void hideKeyboard() {
    keyCheck();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// Method to show [SnackBar] on the UI for any user action ackownledgement
  ///
  /// It also clears the previous [SnackBar] before showing a new one
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

  /// Getter for checking if route can be poped or not
  bool get canPop => _navKey.currentState?.canPop() ?? false;

  /// Pushes the given route of [routeName] to the top of the stack
  Future<T?> push<T>(String routeName, {Object? arguments}) async {
    keyCheck();
    return await _navKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Replaces the top most route from stack by given [routeName]
  Future<T?> replace<T>(String routeName, {Object? arguments}) async {
    keyCheck();
    return await _navKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Replaced routes until a matched route is found in stack
  Future<T?> replaceUntil<T>(String routeName, {Object? arguments}) async {
    keyCheck();
    popUntilRoot();
    return await push<T>(routeName, arguments: arguments);
  }

  /// Pops route if the route can be poped from stack
  void pop([dynamic value]) {
    keyCheck();
    if (_navKey.currentState?.canPop() ?? false) {
      _navKey.currentState?.pop(value);
    }
  }

  /// Pops all routes till the [routeName] passed as argument
  /// matches from the route present in stack
  void popUntil(String routeName) {
    keyCheck();
    _navKey.currentState?.popUntil(
      ModalRoute.withName(routeName),
    );
  }

  /// Pops all the routes in stack until only the bottom most route is left
  void popUntilRoot() {
    keyCheck();
    _navKey.currentState?.popUntil(
      (route) => route.isFirst && route.isCurrent && route.isActive,
    );
  }

  /// To close the app completely
  void systemPop() async {
    keyCheck();
    await SystemNavigator.pop();
  }
}
