import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/constant/app_constants.dart';
import 'package:getx_state_management/screens/home_screen.dart';
import 'package:getx_state_management/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  
  Future<void> login() async {
    isLoading = true;
    update();
    await Future.delayed(Duration(seconds: 1));

    if (usernameController.text == AppConstants.username &&
        passwordController.text == AppConstants.password) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstants.loginKey, true);

      Get.offAll(() => HomeScreen());
    } else {
      Get.snackbar('Error', 'Wrong Credentials');
    }
    isLoading = false;
    update();
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => LoginScreen());
  }
}
