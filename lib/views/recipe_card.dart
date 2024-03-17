import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/util/index.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final List<String> steps;
  const RecipeCard(
      {super.key,
      required this.recipe,
      required this.title,
      required this.cookTime,
      required this.rating,
      required this.thumbnailUrl,
      required this.steps});
  @override
  RecipeCardState createState() => RecipeCardState();
}

class RecipeCardState extends State<RecipeCard> {
  late Box<Recipe> likedBox;
  bool _isLiked = false;
  var keysOfData = [];

  @override
  void initState() {
    super.initState();
    // _loadLikedRecipes() box ;
    likedBox = HiveBoxManager().likedRecipesBox;
    _checkLiked(widget.recipe);
  }

  void _checkLiked(Recipe recipe) async {
    for (var i = 0; i < likedBox.length; i++) {
      var data = likedBox.getAt(i) as Recipe;
      if (data == recipe) {
        keysOfData.add(likedBox.keyAt(i));
        _isLiked = true;
      }
    }
  }

  void _deleteFromLiked() async {
    for (var key in keysOfData) {
      await likedBox.delete(key);
    }
    keysOfData = [];
    setState(() {
      _isLiked = false;
    });
    _checkLiked(widget.recipe);
  }

  void _addToLiked(Recipe recipe) async {
    likedBox.add(recipe);
    setState(() {
      _isLiked = true;
    });
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
          image: NetworkImage(widget.thumbnailUrl),
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
                widget.title,
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_isLiked) {
                            _deleteFromLiked();
                          } else {
                            _addToLiked(widget.recipe);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.1)),
                        child: Icon(
                          Icons.favorite,
                          color: _isLiked ? Colors.red : Colors.white,
                        ),
                      ),
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
                      Text(widget.cookTime,
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
