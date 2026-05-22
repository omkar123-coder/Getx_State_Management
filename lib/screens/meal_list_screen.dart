import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/meal_controller.dart';
import 'package:getx_state_management/screens/meal_details_screen.dart';

class MealListScreen extends StatelessWidget {
  final String category;

  MealListScreen({
    super.key,
    required this.category,
  });

  final MealController controller = Get.put(MealController());

  @override
  Widget build(BuildContext context) {
    controller.getMeals(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: GetBuilder<MealController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: controller.meals.length,
            itemBuilder: (context, index) {
              final meal = controller.meals[index];

              return ListTile(
                leading: Image.network(
                  meal.image,
                  width: 50,
                ),
                title: Text(meal.name),
                onTap: () {
                  Get.to(
                    () => MealDetailScreen(
                      mealId: meal.id,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
