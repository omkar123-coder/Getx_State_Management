import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/meal_controller.dart';
import 'package:getx_state_management/screens/meal_details_screen.dart';

class MealListScreen extends StatefulWidget {
  final String category;

  const MealListScreen({
    super.key,
    required this.category,
  });

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  final MealController controller = Get.find<MealController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.getMeals(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: GetBuilder<MealController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.meals.length,
            itemBuilder: (context, index) {
              final meal = controller.meals[index];
      return Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> MealDetailScreen(mealId: meal.id)));
        },

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CachedNetworkImage(
              imageUrl: meal.image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                meal.name,
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
      ),
    );
        },
      );},
    ));
  }
}
