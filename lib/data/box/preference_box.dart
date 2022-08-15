import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/// Preference box for conveinence of accessability
class PreferenceBox {
  static const String preferenceBox = 'PREFERENCE_BOX';
  static const String tokenKey = 'TOKEN';

  /// Singleton for [PreferenceBox]
  PreferenceBox._() {
    _box = Hive.box(preferenceBox);
  }
  static final PreferenceBox _singleton = PreferenceBox._();
  factory PreferenceBox() => _singleton;

  /// [PreferenceBox] singleton instance for public use.
  static PreferenceBox get i => _singleton;

  /// late initialization of Hive [Box]
  late Box _box;

  /// Setter for user token
  set token(String value) =>
      _box.put(tokenKey, value).catchError((error, stack) {
        debugPrint(error.toString());
        debugPrintStack(stackTrace: stack);
      });

  /// Getter for user token
  String get token => _box.get(tokenKey) ?? '';

  /// Method for flushing and clearing all the values of the box
  Future<void> clearBox() async {
    Iterable allKeys = _box.keys;
    await _box.deleteAll(allKeys);
    log(allKeys.toList().toString(), name: 'prefs box keys');
    await _box.flush();
  }
}
