import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/util/index.dart';

class LikedRecipesScreen extends StatefulWidget {
  final String title;
  const LikedRecipesScreen({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LikedRecipesScreenState createState() => _LikedRecipesScreenState();
}

class _LikedRecipesScreenState extends State<LikedRecipesScreen> {
  late List<Recipe> _likedRecipes = [];

  @override
  void initState() {
    super.initState();
    _loadLikedRecipes();
  }

  Future<void> _loadLikedRecipes() async {
    final likedRecipesBox = await Hive.box<Recipe>('likedRecipes');
    setState(() {
      _likedRecipes = likedRecipesBox.values.toList();
    });
    print(_likedRecipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const AppMenu(),
      body: _likedRecipes.isNotEmpty
          ? ListView.builder(
              itemCount: _likedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _likedRecipes[index];
                return RecipeCard(
                  recipe: recipe,
                  title: recipe.name,
                  cookTime: recipe.totalTime,
                  rating: recipe.rating.toString(),
                  thumbnailUrl: recipe.images,
                  steps: recipe.steps,
                );
              },
            )
          : const Center(
              child: Text('No liked recipes yet!'),
            ),
    );
  }
}
