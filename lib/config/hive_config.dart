import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../data/box/preference_box.dart';
import '../data/generated_model/generated_model_export.dart';

class HiveConfig {
  HiveConfig._();
  static Future<void> init() async {
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
    Hive.registerAdapter(PreferenceModelAdapter());
    await Future.wait([
      Hive.openBox(PreferenceBox.preferenceBox),
    ]);
  }
}
