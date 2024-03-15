import 'package:hive/hive.dart';

part 'grocery_adapter.g.dart';

@HiveType(typeId: 2)
class GroceryList {
  
  GroceryList({
    required this.name,
    required this.ingredients
  });
  
  @HiveField(0)
  String name;
  
  @HiveField(1)
  final List<String> ingredients;
}