import 'package:hive/hive.dart';

part 'preference_model.g.dart';

/// Checkout https://docs.hivedb.dev/#/ for more info
@HiveType(typeId: 0)
class PreferenceModel {
  @HiveField(0)
  String? token;
}
