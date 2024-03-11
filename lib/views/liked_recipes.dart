import 'package:flutter/material.dart';
import 'package:recipe_app/util/index.dart';

class LikedRecipes extends StatefulWidget {
  final String title;
  const LikedRecipes({super.key, required this.title});

  @override
  State<LikedRecipes> createState() => _LikedRecipesState();
}

class _LikedRecipesState extends State<LikedRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const AppMenu(),
      body: const Center(
        child: Column(
          children: [Text('TODO: Liked Recipes Screen')],
        ),
      ),
    );
  }
}