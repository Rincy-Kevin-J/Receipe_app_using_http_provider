import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receipe_using_http_and_provider/receipe%20app/provider/receipe_provider.dart';
import 'package:receipe_using_http_and_provider/receipe%20app/screens/recipeHome.dart';

void main() {
  runApp(ReceipeApp());
}

class ReceipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ReceipeProvider()..getReceipe())
    ],
       child: MaterialApp(
    home: RecipeHome(),
    ),
    );
  }
}
