import 'dart:developer' show log;
import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/ui/errors/internet_error_view.dart';
import 'package:singleton_pattern/ui/errors/maintenance_view.dart';
import 'package:singleton_pattern/ui/errors/page_not_found_view.dart';

part 'enums.dart';
part 'extensions.dart';
part 'log_util.dart';
part 'png.dart';
part 'routes.dart';
part 'theme.dart';
part 'typedefs.dart';
part 'ui_strings.dart';

mixin Core {
  ThemeData theme(BuildContext context) => AppTheme.easerTheme(context);

  RouteFunction get routes => _Routes.appRoutes;

  GlobalKey<NavigatorState> get rootNavKey => _Routes.instance.rootNavKey;

  NavigationService get navigator => NavigationService();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      _Routes.onGenerateRoute(settings);

  /// Navigation observers to monitor route navigation
  List<NavigatorObserver> get observers => _Routes.observers;

  /// Theme colors referenced from style guide by designer team
  Color get primaryColor => AppTheme.primaryColor;
  Color get primaryColorLight => AppTheme.primaryColorLight;
  Color get primaryColorLighter => AppTheme.primaryColorLighter;
  Color get primaryColorDark => AppTheme.primaryColorDark;
  Color get facebookBlue => AppTheme.facebookBlue;
  Color get neutralBlack => AppTheme.neutralBlack;
  Color get neutralGrey => AppTheme.neutralGrey;
  Color get visibleGrey => AppTheme.visibleGrey;
  Color get visibleGreyDark => AppTheme.visibleGreyDark;
  Color get hintGrey => AppTheme.hintGrey;
  Color get lightGrey => AppTheme.lightGrey;
  Color get textGrey => AppTheme.textGrey;
  Color get borderGrey => AppTheme.borderGrey;
  Color get grey => AppTheme.grey;
  Color get white => AppTheme.white;
  Color get black => AppTheme.black;
  Color get red => AppTheme.red;
  Color get golden => AppTheme.golden;
  Color get redLighter => AppTheme.redLighter;

  /// Text styles for App theme referenced from style guide by designer team
  TextStyle get roboto900 => AppTheme.roboto900;
  TextStyle get roboto800 => AppTheme.roboto800;
  TextStyle get roboto700 => AppTheme.roboto700;
  TextStyle get roboto600 => AppTheme.roboto600;
  TextStyle get roboto500 => AppTheme.roboto500;
  TextStyle get roboto400 => AppTheme.roboto400;
  TextStyle get roboto300 => AppTheme.roboto300;
}
