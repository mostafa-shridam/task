import 'package:hive/hive.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/feature/home/presentation/model/event_entity.dart';

class EventModel extends HiveObject {
  String id;
  String title;
  String hijriStartsAt;
  String startsAt;
  String remainingDays;
  String eventDate;
  String eventDateEn;
  String eventDay;
  String eventDateAr;
  String? endsAt;
  String? hijriEndsAt;
  int interval;
  String startsEn;
  String? details;
  String createdAt;
  String publishedAt;
  bool pinned;
  int? color;

  EventModel({
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

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'].toString(),
      title: json['title'],
      hijriStartsAt: json['hijri_starts_at'],
      startsAt: json['starts_at'],
      remainingDays: json['remaining_days'],
      eventDate: json['event_date'],
      eventDateEn: json['event_date_en'],
      eventDay: json['event_day'],
      eventDateAr: json['event_date_ar'],
      endsAt: json['ends_at'],
      hijriEndsAt: json['hijri_ends_at'],
      interval: json['interval'],
      startsEn: json['starts_en'],
      details: json['details'],
      createdAt: json['created_at'],
      publishedAt: json['published_at'],
      pinned: json['pinned'],
      color: json['color'] ?? AppColors.primaryColor.value,
    );
  }
  factory EventModel.fromEntity(EventEntity event) {
    return EventModel(
      id: event.id,
      title: event.title,
      hijriStartsAt: event.hijriStartsAt,
      startsAt: event.startsAt,
      remainingDays: event.remainingDays,
      eventDate: event.eventDate,
      eventDateEn: event.eventDateEn,
      eventDay: event.eventDay,
      eventDateAr: event.eventDateAr,
      endsAt: event.endsAt,
      hijriEndsAt: event.hijriEndsAt,
      interval: event.interval,
      startsEn: event.startsEn,
      details: event.details,
      createdAt: event.createdAt,
      publishedAt: event.publishedAt,
      pinned: event.pinned,
      color: event.color,
    );
  }

  EventEntity toEntity() {
    return EventEntity(
      id: id,
      title: title,
      hijriStartsAt: hijriStartsAt,
      startsAt: startsAt,
      remainingDays: remainingDays,
      eventDate: eventDate,
      eventDateEn: eventDateEn,
      eventDay: eventDay,
      eventDateAr: eventDateAr,
      endsAt: endsAt,
      hijriEndsAt: hijriEndsAt,
      interval: interval,
      startsEn: startsEn,
      details: details,
      createdAt: createdAt,
      publishedAt: publishedAt,
      pinned: pinned,
      color: color ?? AppColors.primaryColor.value,
    );
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'hijri_starts_at': hijriStartsAt,
      'starts_at': startsAt,
      'remaining_days': remainingDays,
      'event_date': eventDate,
      'event_date_en': eventDateEn,
      'event_day': eventDay,
      'event_date_ar': eventDateAr,
      'ends_at': endsAt,
      'hijri_ends_at': hijriEndsAt,
      'interval': interval,
      'starts_en': startsEn,
      'details': details,
      'created_at': createdAt,
      'published_at': publishedAt,
      'pinned': pinned,
      'color': color,
    };
  }
}
