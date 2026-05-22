import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/model/meal_model.dart';
import 'package:getx_state_management/service/api_service.dart';

class SearchMealController extends GetxController {
  final ApiService apiService = ApiService();

  bool isLoading = false;

  List<MealModel> meals = [];

  Future<void> searchMeal(String mealName) async {
    if (mealName.trim().isEmpty) {
      meals.clear();
      update();
      return;
    }

    isLoading = true;
    update();

    try {
      final response = await apiService.getApi(
        "${ApiConstants.searchMeal}$mealName",
      );

      final data = response['meals'];

      if (data != null) {
        meals = (data as List)
            .map(
              (e) => MealModel.fromJson(e),
            )
            .toList();
      } else {
        meals = [];
      }
    } catch (e) {
      meals = [];
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }

    isLoading = false;
    update();
  }
}