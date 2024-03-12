import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Row(
          children: [
            Image.asset(
              'assets/images/app_logo.webp',
              height: 40,
            ),
            const Text('Menu', style: TextStyle(fontSize: 30)),
          ],
        )),
        ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('My Liked...'),
            onTap: () => context.go('')),
        ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Global Recipes'),
            onTap: () => context.go('/global_recipes')),
        ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Shopping Cart'),
            onTap: () => context.go('')),
        ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Add Recipe'),
            onTap: () => context.go('')),
        ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Logout function
              context.go('/');
            })
      ],
    );
  }
}
