import 'package:flutter/material.dart';
import '../Modelos/user_model.dart';
import '/Data/activity.dart';

class User extends ChangeNotifier {
  static int intGen = 0;
  int id = intGen++;
  String username;
  String email;
  String password;
  List<Activity> activities = [];

  User(this.username, this.email, this.password);
  
  List<User> users = [];
  
  get getUsername => username;

  set setUsername( username) => this.username = username;

  get getEmail => email;

  set setEmail( email) => this.email = email;

  get getPassword => password;

  set setPassword( password) => this.password = password;

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

  void addActivity(Activity activity) {
    activities.add(activity);
    notifyListeners();
  }

  void updateActivity(Activity activity) {
    if (activities.contains(activity)) {
      activities[activities.indexOf(activity)] = activity;
      notifyListeners();
    }else{
      addActivity(activity);
    }
  }

  get getActivity => activities[activities.length - 1];
}

class UserProvider with ChangeNotifier {
  UserM? _user;

  UserM? get user => _user;

  void login(UserM user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}