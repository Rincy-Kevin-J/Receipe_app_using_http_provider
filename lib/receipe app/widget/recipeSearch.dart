import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receipe_using_http_and_provider/receipe%20app/provider/receipe_provider.dart';

import '../model/receipe_model.dart';

class Recipesearch extends SearchDelegate<String>{
  //to customize search text field
  Recipesearch():super(searchFieldLabel: "Enter Search Text");
  ///methods builds the action for the appbar,ed:if
  ///it is a clear button that clears search query
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed:() {
        query="";
      }, icon: Icon(Icons.clear))
    ];
  }
  ///this methods builds a leading widget for the appbar
  ///commonly a back button to close the search
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context,"");
    }, icon: Icon(Icons.arrow_back));
  }
  ///this methods show the result of search querry,
  ///here it displays the search querry itself
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
   ///this method shows the suggestion while typing,
  ///filters the search results list based on the query and
  ///displays the matching results
  @override
  Widget buildSuggestions(BuildContext context) {
    final recipeProvider = Provider.of<ReceipeProvider>(context);
    final List<Recipe>suggestion=query.isEmpty?[]:
    recipeProvider.recipes.where((recipe) {
    return recipe.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(suggestion[index].name??""),
            onTap: () {
              close(context, suggestion[index].name??"");
            },
          );
        });
  
  }
  
}