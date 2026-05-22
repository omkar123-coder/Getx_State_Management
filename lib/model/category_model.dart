class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String description;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['idCategory']?.toString() ?? "",
      name: json['strCategory']?.toString() ?? "",
      image: json['strCategoryThumb']?.toString() ?? "",
      description: json['strCategoryDescription']?.toString() ?? "",
    );
  }
}
