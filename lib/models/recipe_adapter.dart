import 'package:hive/hive.dart';

part 'recipe_adapter.g.dart';

@HiveType(typeId: 1,)
class Recipe {
  
  Recipe({
    required this.name,
    required this.images,
      required this.rating,
      required this.totalTime,
      required this.steps,
      required this.ingredients
  });

  
  
  @HiveField(0)
  String name;
  
  @HiveField(1)
  final String images;

  @HiveField(2)
  final double rating;

  @HiveField(3)
  final String totalTime;
  
  @HiveField(4)
  final List<String> steps;
  
  @HiveField(5)
  final List<String> ingredients;


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
            : [],

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

