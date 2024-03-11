import 'package:flutter/material.dart';
import 'package:recipe_app/index.dart';

class RecipeScreen extends StatelessWidget {
  final String title;
  const RecipeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const AppMenu(),
      body: const Center(
        child: Column(
          children: [
            Text('TODO: Recipe Screen')
          ],
        ),
      ),
    );
  }
}