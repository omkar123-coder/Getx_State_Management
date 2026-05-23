import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/search_controller.dart';
import 'package:getx_state_management/screens/meal_details_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchMealController controller = Get.put(SearchMealController());

  final TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.searchMeal('mealName');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Meal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Meal",
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.searchMeal(
                      searchController.text,
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GetBuilder<SearchMealController>(
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
            ),
          ],
        ),
      ),
    );
  }
}
