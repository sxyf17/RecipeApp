import 'package:flutter/material.dart';
import 'package:recipe_app/models/grocery_adapter.dart';
import 'package:recipe_app/views/log_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/recipe_adapter.dart';

void main() async {
  // initializing Hive databases
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.openBox<Recipe>('likedRecipesBox');
  Hive.registerAdapter(GroceryListAdapter());
  Hive.openBox<GroceryList>('groceryBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Recipe App',
      theme: ThemeData(
        //New Change
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RecipeHome(),
    );
  }
}
