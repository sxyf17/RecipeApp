import 'package:flutter/material.dart';
import 'package:recipe_app/home.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/global_recipe.dart';

void main() {
  runApp(MyApp());
}

// GoRouter: declarative routing package https://pub.dev/packages/go_router
// Move to route by using context.push(), context.pop(), and context.go('path')
final GoRouter _router = GoRouter(
  //initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const RecipeHome(
            title: 'Recipe Home Page',
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'global_recipes',
            builder: (BuildContext context, GoRouterState state) {
              return const GlobalRecipe(
                title: 'Global Recipe Page',
              );
            },
          ),
          /*GoRoute(
            path: 'my_liked_recipes',
            builder: (BuildContext context, GoRouterState state) {
              return const MyLikedRecipes(
                title: 'My Liked Recipes',
              );
            },
          ),*/
        ]),
  ],
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Recipe App',
      theme: ThemeData(
        //New Change
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

  // This widget is the root of your application.
  /*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Recipe App',
      theme: ThemeData(
        //New Change
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RecipeHome(title: 'Recipe Home Page',),
    );
  }
}*/