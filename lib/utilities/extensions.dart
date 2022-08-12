part of 'core.dart';

extension ContextExtensions on BuildContext {
  /// Returns the current [ThemeData] of the [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Returns the current [MediaQueryData] of the [BuildContext].
  MediaQueryData get mq => MediaQuery.of(this);

  OverlayState? get overlay => Overlay.of(this);

  /// Returns the current [ModalRoute] args of the [BuildContext].
  dynamic get routeArgs => ModalRoute.of(this)!.settings.arguments;

  /// Returns the current [TextTheme] of the [BuildContext].
  TextTheme get textTheme => theme.textTheme;

  /// Returns the current [Size] of the [BuildContext].
  Size get mqSize => mq.size;

  /// Returns the current [MediaQueryData.size.width] of the [BuildContext].
  double get width => mq.size.width;

  /// Returns the current [MediaQueryData.size.height] of the [BuildContext].
  double get height => mq.size.height;
}

extension NumOperations on num {
  /// Returns random integer, where max range is
  /// based on the number applied upon.
  String randomInt() => Random().nextInt(toInt()).toString();
}

extension StringExtensions on String {
  /// Camelcase string extension
  String toCamelCase() {
    if (trim().isEmpty) return this;
    List<String> wordList = split(UiString.space).toList();
    if (wordList.length > 1) {
      return wordList
          .takeWhile((String e) => e.trim().isNotEmpty)
          .map((String e) => e[0].toUpperCase() + e.substring(1).toLowerCase())
          .toList()
          .join(UiString.space);
    }
    return wordList.first[0].toUpperCase() +
        wordList.first.substring(1).toLowerCase();
  }

  /// Normalize Firebase or Platform exception message
  String normalizeMessage() {
    if (trim().isEmpty) return this;
    return replaceAll(
      UiString.normalizationRegEx,
      UiString.space,
    ).toCamelCase();
  }

  /// Provide name initials of any provided string
  String initials() {
    if (trim().isEmpty) return this;
    List<String> wordList = split(UiString.space).toList();
    if (wordList.length > 1) {
      return wordList
          .takeWhile((String e) => e.trim().isNotEmpty)
          .map((String e) => e[0].toUpperCase())
          .toList()
          .join();
    }
    return wordList.first[0].toUpperCase();
  }

  DateTime toDate() {
    assert(isNotEmpty, "String must be non-empty to be able to parse");
    final dateTime = DateTime.tryParse(this);
    assert(dateTime != null, "Date format is incorrect");
    return dateTime!;
  }
}
