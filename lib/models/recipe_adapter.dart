import 'package:hive/hive.dart';
import 'package:recipe_app/models/recipe.dart';

part 'recipe_adapter.g.dart';

@HiveType(typeId: 1)
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

}

// class RecipeAdapter extends TypeAdapter<Recipe> {
//   @override
//   final int typeId = 0; // Unique identifier for this adapter

//   @override
//   Recipe read(BinaryReader reader) {
//     // Deserialize the Recipe object
//     return Recipe(
//       name: reader.readString(),
//       images: reader.readString(),
//       rating: reader.readDouble(),
//       totalTime: reader.readString(),
//       steps: List<String>.from(reader.readList()),
//       ingredients: List<String>.from(reader.readList()),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Recipe obj) {
//     // Serialize the Recipe object
//     writer.writeString(obj.name);
//     writer.writeString(obj.images);
//     writer.writeDouble(obj.rating);
//     writer.writeString(obj.totalTime);
//     writer.writeList(obj.steps);
//     writer.writeList(obj.ingredients);
//   }
// }
