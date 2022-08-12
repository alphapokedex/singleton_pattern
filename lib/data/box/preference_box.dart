import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PreferenceBox {
  factory PreferenceBox() => _singleton;
  static const String preferenceBox = 'PREFERENCE_BOX';
  static const String tokenKey = 'TOKEN';

  PreferenceBox._() {
    _box = Hive.box(preferenceBox);
  }

  static final PreferenceBox _singleton = PreferenceBox._();

  late Box _box;

  /// [PreferenceBox] singleton instance for public use.
  static PreferenceBox get i => _singleton;

  /// Setter for user token
  set token(String value) =>
      _box.put(tokenKey, value).catchError((error, stack) {
        debugPrint(error.toString());
        debugPrintStack(stackTrace: stack);
      });

  /// Getter for user token
  String get token => _box.get(tokenKey) ?? '';

  Future<void> clearBox() async {
    Iterable allKeys = _box.keys;
    await _box.deleteAll(allKeys);
    log(allKeys.toList().toString(), name: 'prefs box keys');
    await _box.flush();
  }
}
