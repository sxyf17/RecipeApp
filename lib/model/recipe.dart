import 'package:flutter/material.dart';

class Recipe {
  final String title;
  final String description;
  final String instruction;
  final List<String> ingredients;
  final Widget image;

  Recipe({
    required this.title,
    required this.description,
    required this.instruction,
    required this.ingredients,
    required this.image,
  });
}
