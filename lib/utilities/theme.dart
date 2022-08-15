part of 'core.dart';

class AppTheme {
  /// Color constants for internal use only
  static const _primaryColor = Color(0xFF1EBD73);
  static const _primaryColorLight = Color(0xFF8EDEB9);
  static const _primaryColorLighter = Color(0xFFD7FDEB);
  static const _primaryColorDark = Color(0xFF0F5F3A);
  static const _facebookBlue = Color(0xFF1877F2);
  static const _visibleGrey = Color(0xFFB3B7BB);
  static const _visibleGreyDark = Color(0xFF535763);
  static const _hintGrey = Color(0xFFA9A9A9);
  static const _lightGrey = Color(0xFFF5F5F5);
  static const _textGrey = Color(0xFF696969);
  static const _borderGrey = Color(0xFFF2F2F2);
  static const _grey = Color(0xFFD1D3D4);
  static const _neutralGrey = Color(0xFF9A9FA5);
  static const _white = Colors.white;
  static const _neutralBlack = Color(0xFF1A1D1F);
  static const _golden = Color(0xFFFF9529);
  static const _black = Colors.black;
  static const _red = Colors.red;
  static const _redLighter = Color.fromARGB(255, 244, 199, 199);

  /// Getter for app theme
  static ThemeData get appTheme {
    return ThemeData(
      fontFamily: 'Roboto',
      useMaterial3: true,
      primaryColor: _primaryColor,
      primaryColorDark: _primaryColorDark,
      primaryColorLight: _primaryColorLight,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _primaryColor,
        onPrimary: _white,
        secondary: _primaryColorLight,
        onSecondary: _white,
        error: _red,
        onError: _white,
        background: _white,
        onBackground: _black,
        surface: _primaryColor,
        onSurface: _white,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: primaryColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPrimary: _white,
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: white,
        dayPeriodTextColor: primaryColor,
        hourMinuteTextColor: primaryColor,
        dialHandColor: white,
        dialTextColor: primaryColor,
        dialBackgroundColor: primaryColor.withOpacity(0.1),
        inputDecorationTheme: InputDecorationTheme(focusColor: primaryColor),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(primaryColorLight),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(primaryColor),
        trackColor: MaterialStateProperty.all(primaryColorLighter),
      ),
    );
  }

  /// Theme color scheme getters
  static Color get primaryColor => _primaryColor;
  static Color get primaryColorLight => _primaryColorLight;
  static Color get primaryColorLighter => _primaryColorLighter;
  static Color get primaryColorDark => _primaryColorDark;
  static Color get facebookBlue => _facebookBlue;
  static Color get visibleGrey => _visibleGrey;
  static Color get visibleGreyDark => _visibleGreyDark;
  static Color get hintGrey => _hintGrey;
  static Color get lightGrey => _lightGrey;
  static Color get textGrey => _textGrey;
  static Color get borderGrey => _borderGrey;
  static Color get grey => _grey;
  static Color get neutralGrey => _neutralGrey;
  static Color get white => _white;
  static Color get black => _black;
  static Color get golden => _golden;
  static Color get neutralBlack => _neutralBlack;
  static Color get red => _red;
  static Color get redLighter => _redLighter;

  /// Text styles Getters
  static TextStyle get roboto900 => const TextStyle(
        fontWeight: FontWeight.w900,
      );

  static TextStyle get roboto800 => const TextStyle(
        fontWeight: FontWeight.w800,
      );

  static TextStyle get roboto700 => const TextStyle(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get roboto600 => const TextStyle(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get roboto500 => const TextStyle(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get roboto400 => const TextStyle(
        fontWeight: FontWeight.w400,
      );

  static TextStyle get roboto300 => const TextStyle(
        fontWeight: FontWeight.w300,
      );
}
