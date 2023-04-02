import 'package:hive/hive.dart';

part 'activity_model.g.dart';

@HiveType(typeId: 0)
class ActivityM {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;

  ActivityM(this.name, this.email, this.password);
}