import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:rumahkuehany/api/api.dart';
import 'package:rumahkuehany/config/apiconfig.dart';
import 'package:rumahkuehany/helper/secure_storage_helper.dart';
import 'package:rumahkuehany/models/user.dart';

class AuthService {
  static Future<User> register(
      {required String fullname,
      required String email,
      required String password,
      required String confirm_password}) async {
    try {
      const url = '${ApiConfig.baseUrl}/${ApiConfig.register}';
      final data = {
        'fullname': fullname,
        'email': email,
        'password': password,
        'confirm_password': confirm_password
      };
      final response = await dio.post(url, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseJson = response.data;
        final token = responseJson['data']['token'];
        await SecureStorageHelper.cacheToken(token);
        final user = User.fromJson(responseJson['data']);
        await SecureStorageHelper.cacheUser(user);
        return user;
      } else {
        throw Exception(response.data['message']);
      }
    } on DioError catch (e) {
      rethrow;
    }
  }

  static Future<User> login({
    required String fullname,
    required String password,
  }) async {
    try {
      const url = '${ApiConfig.baseUrl}/${ApiConfig.login}';
      final data = {
        'fullname': fullname,
        'password': password,
      };
      final response = await dio.post(url, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseJson = response.data;
        final token = responseJson['data']['token'];
        await SecureStorageHelper.cacheToken(token);
        final user = User.fromJson(responseJson['data']);
        await SecureStorageHelper.cacheUser(user);
        return user;
      } else {
        throw Exception(response.data['message']);
      }
    } on DioError catch (e) {
      rethrow;
    }
  }
}
