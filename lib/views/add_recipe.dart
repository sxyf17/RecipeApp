import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/util/index.dart';

class AddRecipe extends StatefulWidget {
  final String title;
  const AddRecipe({super.key, required this.title});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  late Box<Recipe> box;

  @override
  void initState() {
    super.initState();
    box = HiveBoxManager().likedRecipesBox;
  }

  Future<void> _addToLiked() async {
    box.add(Recipe(
        name: 'name4',
        images: 'images',
        rating: 1,
        totalTime: 'totalTime',
        steps: ['steps'],
        ingredients: ['ingredients']));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButton:
          ElevatedButton(onPressed: _addToLiked, child: const Icon(Icons.add)),
      drawer: const AppMenu(),
      body: const Center(
        child: Column(
          children: [Text('TODO: Add_Recipe Screen')],
        ),
      ),
    );
  }
}
