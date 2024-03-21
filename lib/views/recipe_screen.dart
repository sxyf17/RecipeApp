import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:quick_plate/util/index.dart';

class RecipeScreen extends StatefulWidget {
  final String title;
  final Recipe recipe;
  const RecipeScreen({super.key, required this.title, required this.recipe});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  //initializing liked recipes box and grocery list box
  late Box<Recipe> likedBox;
  late Box<GroceryList> groceryBox;
  var keysOfData = [];
  bool _isLiked = false;
  bool _onCart = false;

  @override
  void initState() {
    super.initState();
    likedBox = HiveBoxManager().likedRecipesBox;
    groceryBox = HiveBoxManager().groceryListBox;
    _checkLiked(widget.recipe);
  }

  void _addToLiked(Recipe recipe) async {
    likedBox.add(recipe);
    setState(() {
      _isLiked = true;
    });
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

  void _addToGroceryList(Recipe recipe) async {
    groceryBox
        .add(GroceryList(name: recipe.name, ingredients: recipe.ingredients));
    setState(() {
      _onCart = true;
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              RecipeCard(
                recipe: widget.recipe,
                title: widget.recipe.name,
                cookTime: widget.recipe.totalTime,
                rating: widget.recipe.rating.toString(),
                thumbnailUrl: widget.recipe.images,
                steps: widget.recipe.steps,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _onCart
                            ? Colors.lightGreenAccent
                            : Colors.lightBlueAccent,
                      ),
                      onPressed: () {
                        if (!_onCart) {
                          _addToGroceryList(widget.recipe);
                        } else {
                          null;
                        }
                      },
                      child: Text(
                        _onCart ? 'Added!' : 'Quick Add',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.withOpacity(0.5),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 150,
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Loop through each step and display it in a separate Text widget
                        for (String ingredients in widget.recipe.ingredients)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                ingredients,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.7),
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
                        for (String step in widget.recipe.steps)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                step,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isLiked ? Colors.black : Colors.orangeAccent,
                ),
                onPressed: () => {
                  if (_isLiked)
                    {_deleteFromLiked()}
                  else
                    {_addToLiked(widget.recipe)}
                },
                child: Text(
                  _isLiked ? 'Unlike Recipe' : 'Like Recipe',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
