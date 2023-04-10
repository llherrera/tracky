import 'package:hive/hive.dart';
import 'package:geolocator/geolocator.dart';

class PositionAdapter extends TypeAdapter<Position> {
  @override
  final int typeId = 3;
  //int get typeId => 3;

  @override
  Position read(BinaryReader reader) {
    final latitude = reader.readDouble();
    final longitude = reader.readDouble();
    final accuracy = reader.readDouble();
    final altitude = reader.readDouble();
    final heading = reader.readDouble();
    final speed = reader.readDouble();
    final speedAccuracy = reader.readDouble();
    return Position(latitude: latitude, longitude: longitude, accuracy: accuracy, altitude: altitude, heading: heading, speed: speed, speedAccuracy: speedAccuracy, timestamp: DateTime.now());
  }

  @override
  void write(BinaryWriter writer, Position obj) {
    writer.writeDouble(obj.latitude);
    writer.writeDouble(obj.longitude);
    writer.writeDouble(obj.accuracy);
    writer.writeDouble(obj.altitude);
    writer.writeDouble(obj.heading);
    writer.writeDouble(obj.speed);
    writer.writeDouble(obj.speedAccuracy);
  }

}
