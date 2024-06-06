import 'package:http/http.dart'as http;
import 'package:receipe_using_http_and_provider/receipe%20app/model/receipe_model.dart';
class Receipeservice{
  static const String url="https://dummyjson.com/docs/recipes";
  Future<Receipe>fetchRecepie()async{
    final response=await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return receipeFromJson(response.body);
    } else {
      return throw Exception("failed to Load Recipes");
    }
  }

}