import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final List<String> steps;
  RecipeCard(
      {super.key,
      required this.recipe,
      required this.title,
      required this.cookTime,
      required this.rating,
      required this.thumbnailUrl,
      required this.steps});

  final _likedRecipesBox = Hive.box<Recipe>('likedRecipesBox');

  Future<void> _addToLiked(Recipe recipe) async {
    await _likedRecipesBox.add(recipe);
  }

  Recipe? readData(Recipe recipe) {
    print(_likedRecipesBox.get(1));
    return _likedRecipesBox.get(recipe.name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 19, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () => _addToLiked(recipe),
                          child: Image.asset(
                            'assets/images/red_heart.png',
                            height: 7,
                          )),
                      const SizedBox(
                        height: 7,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      ElevatedButton(
                          onPressed: () => readData(recipe),
                          child: const Text('test get'))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const SizedBox(width: 7),
                      Text(cookTime,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
