import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:provider/provider.dart';

class Activity extends ChangeNotifier{
  static int intGen = 0;
  int id = intGen++;
  String? name;
  var dateStart;
  var dateEnd;
  bool? type;

  List<LatLng> routePoints = [];

  Activity();

  get getName => name;

  set setName( name) => this.name = name;

  get getType => type;

  void setType( type) => this.type = type;

  get getId => id;

  set setId( id) => this.id = id;

  List<Activity> activities = [];

  void addActivity(Activity activity) {
    activities.add(activity);
    notifyListeners();
  }

  //void setType(bool isWalk) {}

}