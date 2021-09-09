// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportAdapter extends TypeAdapter<Report> {
  @override
  final int typeId = 4;

  @override
  Report read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Report()
      ..duration = fields[0] as int
      ..point = fields[1] as int
      ..dateCreated = fields[2] as String
      ..execiseName = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Report obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.duration)
      ..writeByte(1)
      ..write(obj.point)
      ..writeByte(2)
      ..write(obj.dateCreated)
      ..writeByte(3)
      ..write(obj.execiseName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
