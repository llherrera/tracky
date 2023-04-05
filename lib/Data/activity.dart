import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 1)
class Activity extends HiveObject{
  static int intGen = 0;
  int id = intGen++;
  @HiveField(0)
  // ignore: prefer_typing_uninitialized_variables
  var dateStart;
  // ignore: prefer_typing_uninitialized_variables
  var dateEnd;
  List<Position> routeList = [];
  @HiveField(1)
  bool? type;

  Activity(this.dateStart, this.type);

  get getType => type;

  void setType( type) => this.type = type;

  get getId => id;

  set setId( id) => this.id = id;

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

  Duration getDuration() {
    return dateEnd.difference(dateStart);
  }

  void addRoute() {
    routeList.add(Position(longitude: -122.4194, latitude: 37.7749, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1));
    routeList.add(Position(longitude: -122.4194, latitude: 37.7749, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1));
    routeList.add(Position(longitude: -122.4194, latitude: 37.7749, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1));
    dateEnd = DateTime.now();
  }
}