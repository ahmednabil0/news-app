import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article.dart';

class Api {
  // ignore: non_constant_identifier_names
  var ApiKey = '526a27b621eb41de896374a9c394004c';

  // ignore: non_constant_identifier_names
  Future<List<Article>> GetGenralNews() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=general&apiKey=$ApiKey');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    List<Article> list = [];
    for (var i in responseBody['articles']) {
      list.add(Article.fromMap(i));
    }
    return list;
  }

// ignore: non_constant_identifier_names
  Future<List<Article>> GetCatgoriesNews(String category) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$ApiKey');
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    List<Article> list = [];
    for (var i in responseBody['articles']) {
      list.add(Article.fromMap(i));
    }
    return list;
  }
}
