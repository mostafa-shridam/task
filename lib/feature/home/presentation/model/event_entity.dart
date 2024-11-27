import 'package:hive/hive.dart';

part 'event_entity.g.dart';

@HiveType(typeId: 0)
class EventEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String hijriStartsAt;

  @HiveField(3)
  String startsAt;

  @HiveField(4)
  String remainingDays;

  @HiveField(5)
  String eventDate;

  @HiveField(6)
  String eventDateEn;

  @HiveField(7)
  String eventDay;

  @HiveField(8)
  String eventDateAr;

  @HiveField(9)
  String? endsAt;

  @HiveField(10)
  String? hijriEndsAt;

  @HiveField(11)
  int interval;

  @HiveField(12)
  String startsEn;

  @HiveField(13)
  String? details;

  @HiveField(14)
  String createdAt;

  @HiveField(15)
  String publishedAt;

  @HiveField(16)
  bool pinned;

  @HiveField(17)
  int color;

  EventEntity({
    required this.id,
    required this.title,
    required this.hijriStartsAt,
    required this.startsAt,
    required this.remainingDays,
    required this.eventDate,
    required this.eventDateEn,
    required this.eventDay,
    required this.eventDateAr,
    this.endsAt,
    this.hijriEndsAt,
    required this.interval,
    required this.startsEn,
    this.details,
    required this.createdAt,
    required this.publishedAt,
    required this.pinned,
    required this.color,
  });

}
