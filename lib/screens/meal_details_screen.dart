import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/meal_detail_controller.dart';
import 'package:share_plus/share_plus.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;

  const MealDetailScreen({
    super.key,
    required this.mealId,
  });

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final MealDetailController controller = Get.find<MealDetailController>();

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.getMealDetail(widget.mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  CachedNetworkImage(
                    imageUrl: meal.image,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(meal.instructions),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Share.share(
                        meal.name,
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
