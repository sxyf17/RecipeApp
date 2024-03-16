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
  late Box<Recipe> likedBox;

  @override
  void initState() {
    super.initState();
    likedBox = HiveBoxManager().likedRecipesBox;
  }

  Future<void> _addToLiked() async {
    //todo

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
