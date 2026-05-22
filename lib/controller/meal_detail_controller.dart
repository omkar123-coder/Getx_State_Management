import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/service/api_service.dart';

class MealDetailController extends GetxController {
  final ApiService apiService = ApiService();

  bool isLoading = false;

  Map<String, dynamic>? meal;

  Future<void> getMealDetail(String id) async {
    isLoading = true;
    update();

    final response = await apiService.getApi(
      "${ApiConstants.mealDetail}$id",
    );

    meal = response['meals'][0];

    isLoading = false;
    update();
  }
}
