import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/receipe_model.dart';

class RecipeGridView extends StatelessWidget {
  final List<Recipe> recipes;
  final int crossAxisCount;
  final double maxWidth;

  const RecipeGridView(
      this.recipes,
      this.crossAxisCount,
      this.maxWidth);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => RecipeDetails(recipe: recipe),
                //     ));
              },
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: maxWidth / crossAxisCount * .6,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: recipe.image != null
                              ? Image.network(
                            recipe.image!,
                            fit: BoxFit.cover,
                          )
                              : Container(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(recipe.name!,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cuisine : ${recipe.cuisine}",
                            style: const TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.italic
                            ),),
                          Text("Difficulty : ${recipe.difficulty}",
                            style: const TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.italic
                            ),)
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}