import 'package:hive/hive.dart';
import 'package:recipe_app/models/recipe_adapter.dart';

class HiveBoxManager {
  static final HiveBoxManager _singleton = HiveBoxManager._internal();
  late Box<Recipe> box;

  factory HiveBoxManager() {
    return _singleton;
  }

  HiveBoxManager._internal() {
    box = Hive.box<Recipe>('likedRecipesBox');
  }
}
