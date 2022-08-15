import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../data/box/preference_box.dart';
import '../data/generated_model/generated_model_export.dart';

class HiveConfig {
  HiveConfig._();
  static Future<void> init() async {
    /// Checks for Mobile platforms and passes application document directory
    /// path for the [Hive] library to generate and open database files
    if (!kIsWeb) {
      Directory directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path);
    }

    /// For eg.
    /// ```
    ///   Hive.registerAdapter(<GeneratedModelName>Adapter());
    /// ```
    /// All Hive models need to be registered if they
    /// are custom generated models

    /// Register Hive Adapters below
    /// Adaptors are Developer created DataTypes which can be
    /// stored in [Hive] Datebase as per convienence
    Hive.registerAdapter(PreferenceModelAdapter());
    await Future.wait([
      /// Opens the box (similar to a collection/table) of sorts
      /// but can also act as a small DB on it's own
      ///
      /// Every box has it's own key
      /// and multiple key value pair can be stored inside a box
      Hive.openBox(PreferenceBox.preferenceBox),
    ]);
  }
}
