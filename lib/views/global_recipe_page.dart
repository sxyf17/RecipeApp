import 'package:flutter/material.dart';
import 'package:recipe_app/util/index.dart';
import '../models/recipe.api.dart';
import 'recipe_screen.dart';

class GlobalRecipesPage extends StatefulWidget {
  final String title;
  const GlobalRecipesPage({super.key, required this.title});

  @override
  State<GlobalRecipesPage> createState() => _GlobalRecipesPageState();
}

class _GlobalRecipesPageState extends State<GlobalRecipesPage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: const AppMenu(),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeScreen(
                                    title: 'Recipe Details',
                                    recipe: _recipes[index],
                                  )),
                        );
                      },
                      child: RecipeCard(
                          recipe: 
                              _recipes[index],
                          title: _recipes[index].name,
                          cookTime: _recipes[index].totalTime,
                          rating: _recipes[index].rating.toString(),
                          thumbnailUrl: _recipes[index].images,
                          steps: _recipes[index].steps));
                },
              ));
  }
}
