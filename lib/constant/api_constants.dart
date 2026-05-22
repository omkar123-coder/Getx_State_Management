class ApiConstants {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  static const String categories = "$baseUrl/categories.php";

  static const String filterByCategory = "$baseUrl/filter.php?c=";

  static const String mealDetail = "$baseUrl/lookup.php?i=";

  static const String randomMeal = "$baseUrl/random.php";

  static const String searchMeal = "$baseUrl/search.php?s=";
}
