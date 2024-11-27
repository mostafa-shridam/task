// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventEntityAdapter extends TypeAdapter<EventEntity> {
  @override
  final int typeId = 0;

  @override
  EventEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      hijriStartsAt: fields[2] as String,
      startsAt: fields[3] as String,
      remainingDays: fields[4] as String,
      eventDate: fields[5] as String,
      eventDateEn: fields[6] as String,
      eventDay: fields[7] as String,
      eventDateAr: fields[8] as String,
      endsAt: fields[9] as String?,
      hijriEndsAt: fields[10] as String?,
      interval: fields[11] as int,
      startsEn: fields[12] as String,
      details: fields[13] as String?,
      createdAt: fields[14] as String,
      publishedAt: fields[15] as String,
      pinned: fields[16] as bool,
      color: fields[17] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EventEntity obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.hijriStartsAt)
      ..writeByte(3)
      ..write(obj.startsAt)
      ..writeByte(4)
      ..write(obj.remainingDays)
      ..writeByte(5)
      ..write(obj.eventDate)
      ..writeByte(6)
      ..write(obj.eventDateEn)
      ..writeByte(7)
      ..write(obj.eventDay)
      ..writeByte(8)
      ..write(obj.eventDateAr)
      ..writeByte(9)
      ..write(obj.endsAt)
      ..writeByte(10)
      ..write(obj.hijriEndsAt)
      ..writeByte(11)
      ..write(obj.interval)
      ..writeByte(12)
      ..write(obj.startsEn)
      ..writeByte(13)
      ..write(obj.details)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.publishedAt)
      ..writeByte(16)
      ..write(obj.pinned)
      ..writeByte(17)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
