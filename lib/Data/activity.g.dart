// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityAdapter extends TypeAdapter<Activity> {
  @override
  final int typeId = 1;

  @override
  Activity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Activity(
      fields[0] as dynamic,
      fields[1] as dynamic,
      fields[2] as bool?,
      fields[3] as String,
      (fields[4] as List).cast<Position>(),
    );
  }

  @override
  void write(BinaryWriter writer, Activity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.dateStart)
      ..writeByte(1)
      ..write(obj.dateEnd)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.routeList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
