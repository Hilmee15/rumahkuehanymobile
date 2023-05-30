import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rumahkuehany/models/user.dart';
import 'package:rumahkuehany/pages/homepage.dart';
import 'package:rumahkuehany/services/auth_service.dart';

class AuthController extends GetxController {
  var user = User().obs;
  var isLoading = false.obs;
  var isSuccess = false.obs;
  var isError = false.obs;
  var message = ''.obs;

  void register({
    required String fullname,
    required String email,
    required String password,
    required String confirm_password,
  }) async {
    try {
      isLoading.value = true;
      final userData = await AuthService.register(
        fullname: fullname,
        email: email,
        password: password,
        confirm_password: confirm_password,
      );

      user(userData);
      isSuccess.value = true;
      isLoading.value = false;
      Get.to(() => HomePage());
    } on DioError catch (e) {
      log(e.toString());
      message.value = 'Error';
      isError.value = true;
      isLoading.value = false;
    }
  }

  void login({
    required String fullname,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      final userData = await AuthService.login(
        fullname: fullname,
        password: password,
      );

      user(userData);
      isSuccess.value = true;
      isLoading.value = false;
      Get.to(() => HomePage());
    } on DioError catch (e) {
      log(e.toString());
      message.value = 'Error';
      isError.value = true;
      isLoading.value = false;
    }
  }
}
