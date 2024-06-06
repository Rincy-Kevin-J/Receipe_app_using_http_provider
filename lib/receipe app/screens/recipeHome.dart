import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receipe_using_http_and_provider/receipe%20app/provider/receipe_provider.dart';
import 'package:receipe_using_http_and_provider/receipe%20app/widget/recipeSearch.dart';

import '../widget/receipeGridView.dart';

class RecipeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recepieProvider = Provider.of<ReceipeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Food Recipes",
          ),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
                onPressed: () async {
                  final String? query = await showSearch(
                      context: context, delegate: Recipesearch());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: recepieProvider.recipes.isEmpty
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        )
            : LayoutBuilder(builder: (context, constrains) {
          if (constrains.maxWidth >= 600) {
            return RecipeGridView(
                recepieProvider.recipes, 4, constrains.maxWidth);
          } else if (constrains.maxWidth >= 400) {
            return RecipeGridView(
                recepieProvider.recipes, 2, constrains.maxWidth);
          } else {
            return RecipeGridView(
                recepieProvider.recipes, 1, constrains.maxWidth);
          }
        }));
  }
}