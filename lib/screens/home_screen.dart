import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/category_controller.dart';
import 'package:getx_state_management/screens/meal_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
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
                Get.to(
                  ()=> MealListScreen(
                    category: category.name,
                  )
                );
              },
            );
          },
        );
      }),
    );
  }
}
