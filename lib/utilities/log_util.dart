part of 'core.dart';

mixin LogUtil {
  void debugLog(message, [Object? error, StackTrace? stackTrace]) {
    Logger().d(message, error, stackTrace);
  }

  void errorLog(message, [Object? error, StackTrace? stackTrace]) {
    Logger().e(message, error, stackTrace);
  }

  void infoLog(message, [Object? error, StackTrace? stackTrace]) {
    Logger().i(message, error, stackTrace);
  }

  void verboseLog(message, [Object? error, StackTrace? stackTrace]) {
    Logger().v(message, error, stackTrace);
  }

  void wtfLog(message, [Object? error, StackTrace? stackTrace]) {
    Logger().wtf(message, error, stackTrace);
  }
}
