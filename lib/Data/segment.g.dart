// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SegmentAdapter extends TypeAdapter<Segment> {
  @override
  final int typeId = 2;

  @override
  Segment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Segment(
      fields[0] as Position,
      fields[1] as Position,
    );
  }

  @override
  void write(BinaryWriter writer, Segment obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.start)
      ..writeByte(1)
      ..write(obj.end);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SegmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
