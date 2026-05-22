import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/category_controller.dart';
import 'package:getx_state_management/controller/random_meal_controller.dart';
import 'package:getx_state_management/screens/meal_details_screen.dart';
import 'package:getx_state_management/screens/meal_list_screen.dart';
import 'package:getx_state_management/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CategoryController controller = Get.put(CategoryController());
  final RandomMealController randomController = Get.put(RandomMealController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchScreen());
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              await randomController.getRandomMeal();

              final meal = randomController.randomMeal;

              Get.to(
                () => MealDetailScreen(
                  mealId: meal['idMeal'],
                ),
              );
            },
            icon: const Icon(Icons.shuffle),
          ),
        ],
      ),
      body: GetBuilder<CategoryController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];

            return ListTile(
              leading: Image.network(
                category.image,
                width: 50,
              ),
              title: Text(category.name),
              onTap: () {
                Get.to(() => MealListScreen(
                      category: category.name,
                    ));
              },
            );
          },
        );
      }),
    );
  }
}
