import 'package:flutter/material.dart';
import 'package:recipe_app/util/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroceryListScreen extends StatefulWidget {
  final String title;

  const GroceryListScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  late Box<GroceryList> box;
  late final List<GroceryList> groceryList;

  @override
  void initState() {
    super.initState();
    // Load grocery list box
    box = HiveBoxManager().groceryListBox;
    groceryList = box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: const AppMenu(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(groceryList.length, (index) {
              var ingredients = groceryList[index];
              return Ingredient(ingredients: ingredients);
            }),
          ),
        ),
      ),
    );
  }
}

class Ingredient extends StatefulWidget {
  final GroceryList ingredients;

  const Ingredient({Key? key, required this.ingredients}) : super(key: key);

  @override
  State<Ingredient> createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  late List<bool> checkboxValues;

  @override
  void initState() {
    super.initState();
    // Initialize checkbox values with false for each ingredient
    checkboxValues =
        List<bool>.filled(widget.ingredients.ingredients.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(20),
        color: Colors.amberAccent.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListTile(
            title: Text(
              widget.ingredients.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: widget.ingredients.ingredients.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: checkboxValues[index],
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValues[index] = value ?? false;
                    });
                  },
                  title: Text(widget.ingredients.ingredients[index]),
                );
              },
            ),
          ),
        ));
  }
}
