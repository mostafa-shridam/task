import '../../../home/presentation/model/event_entity.dart';

class EventRepo {
  Future<void> fetchEvents() async {}
  Future<void> editEvent({required EventEntity event}) async {}
  Future<void> addEvent({required EventEntity event}) async {}
  List<EventEntity> getEvent() {
    return [];
  }

  Future<void> deleteEvent({required int index}) async {}
}
