import 'package:flutter/material.dart';
import 'package:recipe_app/views/log_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/recipe_adapter.dart';

void main() {
  recipeDB();
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

void recipeDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  await Hive.openBox<Recipe>('likedRecipesBox');
}
