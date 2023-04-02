import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class UserMProvider {
  late Box box;

  Future<bool> initBox() async {
    final directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);
    box = await Hive.openBox('userBox');
    return box.isOpen;
  }

  Future<bool> addUser(var user) async {
    await box.add(user);
    return true;
  }

  Map<dynamic, dynamic> readUser() {
    Map<dynamic, dynamic> usersMap = box.toMap();
    return usersMap;
  }

  Future<bool> deleteUser(int i) async {
    await box.deleteAt(i);
    return true;
  }

  Future<bool> updateUser(int i, var user) async {
    await box.putAt(i, user);
    return true;
  }

  dispose() {
    box.close();
  }
}