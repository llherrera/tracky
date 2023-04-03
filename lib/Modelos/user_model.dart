import 'package:hive/hive.dart';

import '../Data/activity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserM extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  List<Activity> activities;

  UserM(this.name, this.email, this.password, this.activities);
}