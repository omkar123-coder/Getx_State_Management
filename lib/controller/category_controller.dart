import 'package:get/get.dart';
import 'package:getx_state_management/constant/api_constants.dart';
import 'package:getx_state_management/model/category_model.dart';
import 'package:getx_state_management/service/api_service.dart';

class CategoryController extends GetxController {
  final ApiService apiService = ApiService();

  bool isLoading = false;

  List<CategoryModel> categories = [];

  Future<void> getcategories() async {
    isLoading = true;
    update();

    final response = await apiService.getApi(ApiConstants.categories);

    categories = ((response['categories'] ?? []) as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    isLoading = false;
    update();
  }
}
