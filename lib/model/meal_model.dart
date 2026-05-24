class MealModel {
  final String id;
  final String name;
  final String image;
  final String instructions;

  MealModel({
    required this.id,
    required this.name,
    required this.image,
    required this.instructions,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['idMeal']?.toString() ?? "",
      name: json['strMeal']?.toString() ?? "",
      image: json['strMealThumb']?.toString() ?? "",
      instructions: json['strInstructions']?.toString() ?? "",
    );
  }
}
