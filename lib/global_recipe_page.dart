import 'package:flutter/material.dart';
import 'package:recipe_app/index.dart';

class GlobalRecipesPage extends StatelessWidget {
  final String title;
  const GlobalRecipesPage({super.key, required this.title});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('TODO: Global/All Recipes Screen')],
          ),
        ));
  }
}
