import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/service/api_service.dart';

class RandomMealController extends GetxController {
  final ApiService apiService = ApiService();
  late Map<String, dynamic> randomMeal;
  bool isLoading = false;

  Future<void> getRandomMeal() async {
    isLoading = true;
    update();

    final response = await apiService.getApi(ApiConstants.randomMeal);
    randomMeal = response['meals'][0];

    isLoading = false;
    update();
  }
}
