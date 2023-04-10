import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'Data/user_model.dart';

class HiveService extends ChangeNotifier{
  List<UserM> _users = [];
  
  Future<void> addUser(UserM u) async {
    Box<UserM> box = await Hive.openBox<UserM>('users');
    await box.add(u);
    _users.add(u);
    _users = box.values.toList();
    notifyListeners();
  }
}