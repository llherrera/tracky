// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityMAdapter extends TypeAdapter<ActivityM> {
  @override
  final int typeId = 0;

  @override
  ActivityM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityM(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
