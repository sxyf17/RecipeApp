import 'package:flutter/material.dart';
import 'package:recipe_app/util/index.dart';

class AddRecipe extends StatefulWidget {
  final String title;
  const AddRecipe({super.key, required this.title});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
} 

class _AddRecipeState extends State<AddRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const AppMenu(),
      body: const Center(
        child: Column(
          children: [Text('TODO: Add_Recipe Screen')],
        ),
      ),
    );
  }
}