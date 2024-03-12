import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/menu_drawer.dart';
import 'package:recipe_app/model/initialize_resipe.dart';

class GlobalRecipe extends StatefulWidget {
  const GlobalRecipe({super.key, required this.title});

  final String title;

  @override
  State<GlobalRecipe> createState() => _GlobalRecipeState();
}

class _GlobalRecipeState extends State<GlobalRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Image.asset('assets/images/app_logo.webp'),
          title: const Text('Recipe'),
          /*actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.dehaze_sharp),
              onPressed: () => context.go('/manu.dart'))
        ],*/
        ),
        endDrawer: const Drawer(
          child: MenuDrawer(),
        ),
        body: Center(
          child: const RecipesList(),
        ));
  }
}
