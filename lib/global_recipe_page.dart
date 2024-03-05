import 'package:flutter/material.dart';

class GlobalRecipesPage extends StatelessWidget {
  const GlobalRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
            icon: Icon(Icons.menu), // Menu icon
            onPressed: () {
              // Handle menu button press
              
            },
          ),  
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('TODO: Add Recipes Here')
          ],
        ),
      )
    );
  }
}