import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/category_controller.dart';
import 'package:getx_state_management/controller/meal_controller.dart';
import 'package:getx_state_management/controller/meal_detail_controller.dart';
import 'package:getx_state_management/controller/random_meal_controller.dart';
import 'package:getx_state_management/controller/search_controller.dart';
import 'package:getx_state_management/screens/login_screen.dart';

void main() {
  Get.lazyPut(()=> CategoryController());
  Get.lazyPut(() => RandomMealController());
  Get.lazyPut(() => MealController());
  Get.lazyPut(() => MealDetailController());
  Get.lazyPut(() => SearchMealController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

// exception was thrown: "MealDetailController" not found. You need to call "Get.put(MealDetailController())" or "Get.lazyPut(()=>MealDetailController())"