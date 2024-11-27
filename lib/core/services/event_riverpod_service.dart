import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/core/services/get_it_service.dart';
import 'package:task/feature/home/presentation/model/event_entity.dart';
import 'package:uuid/uuid.dart';

import '../../feature/add_event/presentation/repos/event_repo_impl.dart';

class EventRiverpod extends StateNotifier<List<EventEntity>> {
  final EventRepoImpl repo;

  EventRiverpod(this.repo) : super([]);
  Future<void> getEvent() async {
    final events = repo.getEvent();

    events.sort(
      (a, b) => a.startsAt.compareTo(b.startsAt),
    );

    state = [...events];
  }

  Uuid uuid = const Uuid();
  Future<void> addEvent({required EventEntity event}) async {
    event.id = uuid.v4();
    state = state.where((e) => e.id != event.id).toList();
    log(event.id);
    await repo.addEvent(event: event);
    getEvent();
  }

  Future<void> deleteEvent({required int index}) async {
    state = state.where((element) => element.id != index.toString()).toList();
    await repo.deleteEvent(index: index);
    getEvent();
  }

  Future<void> editEvent({required EventEntity event}) async {
    await repo.editEvent(
      event: event,
    );
    getEvent();
  }

  Future<void> fetchEvents() async {
    await repo.fetchEvents();
    getEvent();
  }
}

final eventProvider =
    StateNotifierProvider<EventRiverpod, List<EventEntity>>((ref) {
  return EventRiverpod(getIt.get<EventRepoImpl>())
    ..fetchEvents()
    ..getEvent();
});
