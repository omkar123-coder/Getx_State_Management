import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/model/meal_model.dart';
import 'package:getx_state_management/service/api_service.dart';

class SearchController extends GetxController {
  final ApiService apiService = ApiService();

  List<MealModel> meals = [];
  bool isLoading = false;

  Future<void> searchMeal(String value) async {
    if (value.isEmpty) return;
    isLoading = true;
    update();

    final response = await apiService.getApi("${ApiConstants.searchMeal}$value");
    meals = (response['meals'] as List).map((e) => MealModel.fromJson(e)).toList();

    isLoading = false;
    update();
  }
}
