import 'package:hive/hive.dart';
import 'package:recipe_app/util/index.dart';

class HiveBoxManager {
  static final HiveBoxManager _singleton = HiveBoxManager._internal();
  late Box<Recipe> likedRecipesBox;
  late Box<GroceryList> groceryListBox;

  factory HiveBoxManager() {
    return _singleton;
  }

  HiveBoxManager._internal() {
    likedRecipesBox = Hive.box<Recipe>('likedRecipesBox');
    groceryListBox = Hive.box<GroceryList>('groceryBox');
  }
}
