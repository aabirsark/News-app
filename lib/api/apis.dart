import 'dart:convert';

import 'package:newfeed/model/headlines.dart';
import 'package:provider/provider.dart';

const String _apiKey = "2b18345d145d47168cb7470d21cfbb7d";

class Api {
  // ? Domain
  static String domain = "https://newsapi.org/v2";

  // ? Top headlines url
  /// it will fetch top headlines of India(in)
  static String topHeadlines =
      "$domain/top-headlines?country=in&apiKey=$_apiKey";

  static String search(String title) {
    String url =
        "$domain/everything?q=${title.replaceAll(" ", "%20")}&apiKey=$_apiKey";
    return url;
  }
}

