import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 1)
class Activity{
  static int intGen = 0;
  int id = intGen++;
  @HiveField(0)
  // ignore: prefer_typing_uninitialized_variables
  var dateStart;
  @HiveField(1)
  // ignore: prefer_typing_uninitialized_variables
  var dateEnd;
  @HiveField(2)
  bool? type;
  @HiveField(3)
  final String userName;
  @HiveField(4)
  List<Position> routeList;

  Activity(this.dateStart, this.dateEnd, this.type, this.userName, this.routeList);

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
        routeList[i + 1].longitude
      );
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