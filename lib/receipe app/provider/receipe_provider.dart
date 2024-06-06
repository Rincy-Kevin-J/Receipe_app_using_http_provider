import 'package:flutter/cupertino.dart';
import 'package:receipe_using_http_and_provider/receipe%20app/service/receipe_service.dart';
import '../model/receipe_model.dart';

class ReceipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> _filteredReceipes = [];

  List<Recipe> get recipes =>
      _filteredReceipes.isNotEmpty ? _filteredReceipes : _recipes;

  Future<void> getReceipe() async {
    try {
      Receipe receipe = await Receipeservice().fetchRecepie();
      _recipes = receipe.recipes ?? [];
      _filteredReceipes =
          _recipes; //initialize filtered receipe with all recipes
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to load receipes: $e");
    }
  }

  void searchRecipes(String query) {
    _filteredReceipes = _recipes.where((recipe) {
      return recipe.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }
}
