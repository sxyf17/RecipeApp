import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/config.dart';
import 'recipe_adapter.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.other.guided"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": apiKey,
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    // ignore: no_leading_underscores_for_local_identifiers
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
