import 'package:flutter/material.dart';
import 'package:recipe_app/util/index.dart';

class ShoppingCart extends StatefulWidget {
  final String title;
  const ShoppingCart({super.key, required this.title});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
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
          children: [
            Text('TODO: Shopping Cart Screen')
          ],
        ),
      ),
    );
  }
}