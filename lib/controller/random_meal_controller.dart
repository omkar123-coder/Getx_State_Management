import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/model/meal_model.dart';
import 'package:getx_state_management/service/api_service.dart';

class RandomMealController extends GetxController {
  final ApiService apiService = ApiService();
  late MealModel randomMeal;
  bool isLoading = false;
  String error = '';


  Future<void> getRandomMeal() async {
    isLoading = true;
    update();

    final response = await apiService.getApi(ApiConstants.randomMeal);
    randomMeal = MealModel.fromJson(response['meals'][0]);

    isLoading = false;
    update();
  }
}
