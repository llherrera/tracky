import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Activity extends ChangeNotifier{
  static int intGen = 0;
  int id = intGen++;
  String? name;
  var dateStart;
  var dateEnd;
  List<Position> routeList = [];
  bool? type;

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

  double getDistance() {
    double distance = 0;
    for (int i = 0; i < routeList.length - 1; i++) {
      distance += Geolocator.distanceBetween(
          routeList[i].latitude,
          routeList[i].longitude,
          routeList[i + 1].latitude,
          routeList[i + 1].longitude);
    }
    return distance;
  }

  //void setType(bool isWalk) {}

}