import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/meal_detail_controller.dart';
import 'package:share_plus/share_plus.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen({
    super.key,
    required this.mealId,
  });

  final MealDetailController controller = Get.put(MealDetailController());

  @override
  Widget build(BuildContext context) {
    controller.getMealDetail(mealId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Detail"),
      ),
      body: GetBuilder<MealDetailController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.meal == null) {
            return const Center(
              child: Text("No Data"),
            );
          }

          final meal = controller.meal!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    meal['strMealThumb'],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    meal['strMeal'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    meal['strInstructions'] ?? "",
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Share.share(
                        meal['strMeal'],
                      );
                    },
                    child: const Text("Share Meal"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
