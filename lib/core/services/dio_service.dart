import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/core/helper/backend_points.dart';

class DioService {
  final Dio dio = Dio();

  Future<Response> get() async {
    try {

      String url = BackendEndPoints.baseUrl;

      return await dio.get(url); // Use resultQuery here
    } on DioException catch (e) {
      debugPrint('In Dio Services Exception$e'); // Corrected typo
      if (e.response != null) {
        return e.response!;
      } else {
        throw Exception('DioException occurred without a response: $e');
      }
    }
  }
}
