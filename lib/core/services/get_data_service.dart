import 'package:flutter/material.dart';
import 'package:task/core/services/dio_service.dart';
import 'package:task/feature/home/presentation/model/event_entity.dart';
import 'package:task/feature/home/presentation/model/event_model.dart';
import 'get_it_service.dart';

class GetDataService {
  final DioService dioService;
  GetDataService() : dioService = getIt.get<DioService>();

  Future<List<EventEntity>> fetchData() async {
    final response = await dioService.get();
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> result = response.data;
        List<EventModel> event = (result['data'] as List)
            .map((e) => EventModel.fromJson(e))
            .toList();
        return event.map((e) => e.toEntity()).toList();
      } catch (e) {
        debugPrint(e.toString());
        throw Exception('Failed to parse data$e');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
