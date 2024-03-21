import 'package:hive/hive.dart';
import 'package:quick_plate/util/index.dart';

class HiveBoxManager {
  static final HiveBoxManager _singleton = HiveBoxManager._internal();
  late Box<Recipe> likedRecipesBox;
  late Box<GroceryList> groceryListBox;
  late Box<User> userLoginBox;

  factory HiveBoxManager() {
    return _singleton;
  }

  HiveBoxManager._internal() {
    likedRecipesBox = Hive.box<Recipe>('likedRecipesBox');
    groceryListBox = Hive.box<GroceryList>('groceryBox');
    userLoginBox = Hive.box<User>('userLoginBox');
  }
}
