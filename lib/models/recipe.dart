class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final List<String> steps;
  final List<String> ingredients;

  //The value of browse-categories/display/tag returned in
  //categories/list API

  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime,
      required this.steps,
      required this.ingredients});

  factory Recipe.fromJson(dynamic json) {
    List<dynamic> ingredientLines = json['ingredientLines'] ?? [];
    List<String> ingredients =
        ingredientLines.map((line) => line['wholeLine'] as String).toList();

    return Recipe(
        name: json['details']['name'] as String,
        images: json['details']['images'][0]['hostedLargeUrl'] as String,
        rating: json['details']['rating'] as double,
        totalTime: json['details']['totalTime'] as String,
        steps: json['preparationSteps'] != null
            ? List<String>.from(json['preparationSteps'])
            : [], // If steps are null, initialize with an empty list

        ingredients: ingredients);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime, steps: $steps, ingredients: $ingredients}';
  }
}
