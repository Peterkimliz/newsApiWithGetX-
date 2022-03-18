import 'dart:convert';
import 'package:diginews/config/keys.dart';
import 'package:diginews/constants/const.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ////initialization of http client
  static final client = http.Client();
  ////getting the top headlines from a given country
  static Future getNews() async {
    var responses = await client.get(Uri.parse(Constants.BASE_URL +
        "top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${Keys.API_KEY}"));
    if (responses.statusCode == 200) {
      var jsonResponse = json.decode(responses.body);
      return jsonResponse;
    } else {
      return null;
    }
  }

// ////getting news by category
//   static Future getCategoryNews() async {
//     "top-headlines?country=us&category=$categoryName&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";
//     var responses = await client.get(Uri.parse(Constants.BASE_URL +
//         "top-headlines?country=us&category=business&apiKey=2db986a03a3d4f9ca5c898fe80b51201"));
//     if (responses.statusCode == 200) {
//       var jsonResponse = json.decode(responses.body);
//       return jsonResponse;
//     } else {
//       return null;
//     }
//   }
}
