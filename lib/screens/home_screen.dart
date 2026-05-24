import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/category_controller.dart';
import 'package:getx_state_management/controller/random_meal_controller.dart';
import 'package:getx_state_management/screens/meal_details_screen.dart';
import 'package:getx_state_management/screens/meal_list_screen.dart';
import 'package:getx_state_management/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoryController controller = Get.find<CategoryController>();
  final RandomMealController randomController = Get.find<RandomMealController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
    controller.getcategories();
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> SearchScreen()));
            },
            icon: const Icon(Icons.search),
          ),

          IconButton( 
            onPressed: () async {
              await randomController.getRandomMeal();
              final meal = randomController.randomMeal;
              Navigator.push(context, MaterialPageRoute(
                builder: (_)=> MealDetailScreen(
                  mealId: meal.id,
                  )
                )
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
              leading: SizedBox(
                height: 50,
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: category.image,
                ),
              ),
              title: Text(category.name),
              onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> MealListScreen(category: category.name,)));
              },
            );
          },
        );
      }),
    );
  }
}