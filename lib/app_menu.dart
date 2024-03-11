import 'package:flutter/material.dart';
import 'package:recipe_app/index.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            horizontalTitleGap: 10,
            title: const Text(
              'My Liked',
              textAlign: TextAlign.start,
            ),
            trailing: Image.asset(
              'assets/images/heart.png',
              height: 40,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LikedRecipes(title: 'Liked Recipes',)),
              );
            },
          ),
          ListTile(
            horizontalTitleGap: 10,
            title: const Text(
              'All Recipes',
              textAlign: TextAlign.start,
            ),
            trailing: Image.asset(
              'assets/images/global.png',
              height: 40,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GlobalRecipesPage(title: 'Global Recipes',)),
              );
            },
          ),
          ListTile(
            horizontalTitleGap: 10,
            title: const Text(
              'My Cart',
              textAlign: TextAlign.start,
            ),
            trailing: const Icon(
              Icons.shopping_cart,
              size: 40,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShoppingCart(title: 'My Shopping Cart',)),
              );
            },
          ),
          ListTile(
            horizontalTitleGap: 10,
            title: const Text(
              'Add Recipe',
              textAlign: TextAlign.start,
            ),
            trailing: const Icon(Icons.add, size: 40),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddRecipe(title: 'Add Recipe',)),
              );
            },
          ),
          ListTile(
            horizontalTitleGap: 10,
            title: const Text(
              'Log Out',
              textAlign: TextAlign.start,
            ),
            trailing: const Icon(Icons.logout, size: 40),
            onTap: () {
              // Add your onTap logic here
            },
          )
        ],
      ),
    );
  }
}
