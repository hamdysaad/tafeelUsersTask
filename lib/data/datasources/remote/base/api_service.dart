import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';


class ApiService {

  static Dio? _dio;

  //https://reqres.in/api/users?page=2
  static String baseUrl = "https://reqres.in/api";

  Dio getInstance() {
    var instance = Dio();
    _dio = instance;
    _init(instance);
    return instance;
  }

  _init(Dio dio) async {
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: !kReleaseMode,
          printResponseHeaders: !kReleaseMode,
          printResponseMessage: !kReleaseMode,
        ),
      ),
    );

    var token = "";

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer $token",
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST,OPTIONS',
        "Access-Control-Allow-Headers": "Content-Type, Authorization"
      },
    );
  }
}
