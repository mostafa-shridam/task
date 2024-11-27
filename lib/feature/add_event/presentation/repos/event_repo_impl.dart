import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/helper/backend_points.dart';
import '../../../../core/services/get_data_service.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../home/presentation/model/event_entity.dart';
import 'event_repo.dart';

class EventRepoImpl implements EventRepo {
  final GetDataService getDataService = getIt.get<GetDataService>();
  @override
  Future<void> fetchEvents() async {
    final eventsData = await getDataService.fetchData();
    try {
      var saveEventBox =
          await Hive.openBox<EventEntity>(BackendEndPoints.events);
      final eventsMap = {for (var event in eventsData) event.id: event};
      await saveEventBox.putAll(eventsMap);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to save events: ${e.toString()}");
    }
  }

  @override
  Future<void> addEvent({required EventEntity event}) async {
    try {
      var addEvent = Hive.box<EventEntity>(BackendEndPoints.events);
      await addEvent.add(event);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to add event${e.toString()}");
    }
  }

  @override
  Future<void> deleteEvent({required int index}) async {
    try {
      var deleteEvent = Hive.box<EventEntity>(BackendEndPoints.events);
      await deleteEvent.delete(index);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to delete event${e.toString()}");
    }
  }

  @override
  Future<void> editEvent({required EventEntity event}) async {
    try {
      var editEvent = Hive.box<EventEntity>(BackendEndPoints.events);
      if (editEvent.containsKey(event.id)) {
        await editEvent.put(event.id, event);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to edit event${e.toString()}");
    }
  }

  List<EventEntity>? eventEntity;
  @override
  getEvent() {
    var hiveEvent = Hive.box<EventEntity>(BackendEndPoints.events);
    try {
      eventEntity = hiveEvent.values.toList();
      if (eventEntity != null) {
        return eventEntity ?? [];
      } else {
        throw Exception("Failed to get event");
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to get event${e.toString()}");
    }
  }
}
