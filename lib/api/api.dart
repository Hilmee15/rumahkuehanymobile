import 'package:dio/dio.dart';
import 'package:rumahkuehany/config/apiconfig.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: ApiConfig.baseUrl
  )
);
