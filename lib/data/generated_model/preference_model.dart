import 'package:hive/hive.dart';

part 'preference_model.g.dart';

@HiveType(typeId: 0)
class PreferenceModel {
  @HiveField(0)
  String? token;
}
