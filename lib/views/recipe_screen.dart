import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/util/index.dart';

class RecipeScreen extends StatelessWidget {
  final String title;
  final Recipe recipe;
  const RecipeScreen({super.key, required this.title, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const AppMenu(),
      body: Center(
        child: Column(
          children: [
            RecipeCard(
                recipe: recipe,
                title: recipe.name,
                cookTime: recipe.totalTime,
                rating: recipe.rating.toString(),
                thumbnailUrl: recipe.images,
                steps: recipe.steps),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
              child: const Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), // 丸角の半径を指定
                color: Color.fromARGB(255, 222, 219, 219), // コンテナの背景色
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 180,
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Text(
                        'Steps:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Loop through each step and display it in a separate Text widget
                      for (String step in recipe.steps)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            step,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
