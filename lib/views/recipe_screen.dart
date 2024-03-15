import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:recipe_app/util/index.dart';

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

  @override
  void initState() {
    super.initState();
    likedBox = HiveBoxManager().likedRecipesBox;
    groceryBox = HiveBoxManager().groceryListBox;
  }

  void _addToLiked(Recipe recipe) async {
    likedBox.add(recipe);
  }

  void _addToGroceryList(Recipe recipe) async {
    groceryBox
        .add(GroceryList(name: recipe.name, ingredients: recipe.ingredients));
    
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
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey,
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
                                borderRadius: BorderRadius.circular(15.0),
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
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () => _addToGroceryList(widget.recipe),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey,
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
                              padding: EdgeInsets.all(5),
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
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () => _addToLiked(widget.recipe),
                child: const Text(
                  'Like Recipe',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class RecipeScreen extends StatelessWidget {
//   final String title;
//   final Recipe recipe;
//   const RecipeScreen({super.key, required this.title, required this.recipe});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         backgroundColor: Colors.deepOrange,
//       ),
//       drawer: const AppMenu(),
//       body: Center(
//         child: Column(
//           children: [
//             RecipeCard(
//                 recipe: recipe,
//                 title: recipe.name,
//                 cookTime: recipe.totalTime,
//                 rating: recipe.rating.toString(),
//                 thumbnailUrl: recipe.images,
//                 steps: recipe.steps),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: const Text(
//                 'Instructions',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0),
//                 color: Colors.grey,
//               ),
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: 180,
//               padding: const EdgeInsets.all(10.0),
//               child: Center(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       const Text(
//                         'Steps:',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       // Loop through each step and display it in a separate Text widget
//                       for (String step in recipe.steps)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15.0),
//                               color: Colors.white,
//                             ),
//                             padding: EdgeInsets.all(5),
//                             child: Text(
//                               step,
//                               style: const TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Ingredient',
//                     style: TextStyle(
//                       fontSize: 30,
//                     ),
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black),
//                       onPressed: () {
//                         //Add to Liked recipe
//                       },
//                       child: const Text(
//                         'Add to Cart',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ))
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0), // 丸角の半径を指定
//                 color: Colors.grey, // コンテナの背景色
//               ),
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: 150,
//               padding: const EdgeInsets.all(10.0),
//               child: Center(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       // Loop through each step and display it in a separate Text widget
//                       for (String ingredients in recipe.ingredients)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15.0),
//                               color: Colors.white,
//                             ),
//                             padding: EdgeInsets.all(5),
//                             child: Text(
//                               ingredients,
//                               style: const TextStyle(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//                 onPressed: () {
//                   //Add to Liked recipe
//                 },
//                 child: const Text(
//                   'Like Recipe',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
