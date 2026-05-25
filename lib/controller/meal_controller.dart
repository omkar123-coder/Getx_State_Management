import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/model/meal_model.dart';
import 'package:getx_state_management/service/api_service.dart';

class MealController extends GetxController {
  final ApiService apiService = ApiService();
  bool isLoading = false;

  List<MealModel> meals = [];

  String error = '';

  Future<void> getMeals(String category) async {
    try {
      isLoading = true;
      update();

      final response =
          await apiService.getApi("${ApiConstants.filterByCategory}$category");
      meals = ((response['meals'] ?? []) as List)
          .map((e) => MealModel.fromJson(e))
          .toList();
    } catch (e) {
      Get.snackbar('Title', error);
    }
    isLoading = false;
    update();
  }
}
