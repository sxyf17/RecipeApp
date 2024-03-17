import 'package:flutter/material.dart';
import 'package:recipe_app/util/index.dart';
import '../views/log_in.dart';

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
              'My Liked Recipes',
              textAlign: TextAlign.start,
            ),
            trailing: Image.asset(
              'assets/images/heart.png',
              height: 40,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LikedRecipesScreen(
                          title: 'Liked Recipes',
                        )),
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
                    builder: (context) => const GlobalRecipesPage(
                          title: 'Global Recipes',
                        )),
              );
            },
          ),
          ListTile(
            horizontalTitleGap: 10,
            title: const Text(
              'My Grocery List',
              textAlign: TextAlign.start,
            ),
            trailing: Image.asset(
              'assets/images/grocery_list.png',
              height: 40,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GroceryListScreen(
                          title: 'My Grocery List',
                        )),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecipeHome(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
