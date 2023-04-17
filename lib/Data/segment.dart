import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

part 'segment.g.dart';

@HiveType(typeId: 2)
class Segment  extends HiveObject{
  @HiveField(0)
  Position start;
  @HiveField(1)
  Position end;
  @HiveField(2)
  List<Position> routeList;

  Segment(this.start, this.end, this.routeList);

  Duration getDuration() {
    return end.timestamp!.difference(start.timestamp!);
  }

  double getSpeed() {
    double speed=0;
    for (var e in routeList) {
      speed+=e.speed;
    }
    return speed/routeList.length;
  }
}