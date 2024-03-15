import 'recipe_adapter.dart';

class RecipeObj {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final List<String> steps;
  final List<String> ingredients;

  //The value of browse-categories/display/tag returned in
  //categories/list API

  RecipeObj(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime,
      required this.steps,
      required this.ingredients});

  factory RecipeObj.fromJson(dynamic json) {
    List<dynamic> ingredientLines = json['ingredientLines'] ?? [];
    List<String> ingredients =
        ingredientLines.map((line) => line['wholeLine'] as String).toList();

    return RecipeObj(
        name: json['details']['name'] as String,
        images: json['details']['images'][0]['hostedLargeUrl'] as String,
        rating: json['details']['rating'] as double,
        totalTime: json['details']['totalTime'] as String,
        steps: json['preparationSteps'] != null
            ? List<String>.from(json['preparationSteps'])
            : [], // If steps are null, initialize with an empty list

        ingredients: ingredients);
  }

  static List<RecipeObj> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RecipeObj.fromJson(data);
    }).toList();
  }

  static Recipe recipeObjToRecipe(RecipeObj recipeObj) {
    return Recipe(
      name: recipeObj.name,
      images: recipeObj.images,
      rating: recipeObj.rating,
      totalTime: recipeObj.totalTime,
      steps: recipeObj.steps,
      ingredients: recipeObj.ingredients,
    );
  }


  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime, steps: $steps, ingredients: $ingredients}';
  }
}
