import 'package:hive/hive.dart';

import 'activity_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserM {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final List<ActivityM> activities;

  UserM(this.name, this.email, this.password, this.activities);
}