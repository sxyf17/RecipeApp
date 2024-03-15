import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/util/index.dart';
import 'recipe_screen.dart';

class LikedRecipesScreen extends StatefulWidget {
  final String title;
  const LikedRecipesScreen({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LikedRecipesScreenState createState() => _LikedRecipesScreenState();
}

class _LikedRecipesScreenState extends State<LikedRecipesScreen> {
  late Box<Recipe> box;

  @override
  void initState() {
    super.initState();
    // _loadLikedRecipes();
    box = HiveBoxManager().likedRecipesBox;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const AppMenu(),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<Recipe> box, _) {
          final likedRecipes =
              box.values.toList(); // Get the list of liked recipes from the box
          return likedRecipes.isNotEmpty
              ? ListView.builder(
                  itemCount: likedRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = likedRecipes[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeScreen(
                                      title: 'Recipe Details',
                                      recipe: likedRecipes[index],
                                    )),
                          );
                        },
                        child: RecipeCard(
                          recipe: recipe,
                          title: recipe.name,
                          cookTime: recipe.totalTime,
                          rating: recipe.rating.toString(),
                          thumbnailUrl: recipe.images,
                          steps: recipe.steps,
                        ));
                  },
                )
              : const Center(
                  child: Text('No liked recipes yet!'),
                );
        },
      ),
    );
  }
}