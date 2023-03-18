import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends ChangeNotifier {
  String username;
  String email;
  String password;

  User(this.username, this.email, this.password);
  
  get getUsername => username;

  set setUsername( username) => this.username = username;

  get getEmail => email;

  set setEmail( email) => this.email = email;

  get getPassword => password;

  set setPassword( password) => this.password = password;
  
  List<User> users = [];

  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  User? checkUser(String username, String password) {
    for (var user in users) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null;
  }
}

class UserProvider with ChangeNotifier {
  User? _user;

  //UserProvider(this._user);

  User? get user => _user;

  void login(User user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}