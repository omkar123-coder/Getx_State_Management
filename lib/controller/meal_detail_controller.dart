import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/model/meal_model.dart';
import 'package:getx_state_management/service/api_service.dart';

class MealDetailController extends GetxController {
  final ApiService apiService = ApiService();
  MealModel? meal;

  bool isLoading = false;

  Future<void> getMealDetail(String id) async {
    isLoading = true;
    update();

    final response = await apiService.getApi(
      "${ApiConstants.mealDetail}$id",
    );

    meal = MealModel.fromJson(response['meals'][0]);

    isLoading = false;
    update();
  }
}
