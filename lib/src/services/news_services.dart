import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'http://newsapi.org/v2';
final _API_KEY = 'dde6d354ea954a1c8c6bb55faff790ef';

class NewsServices with ChangeNotifier {
  List<Article> headlines = [];

  NewsServices() {
    this.getTopHeadlines();
  }
  getTopHeadlines() async {
    final url = '$_URL_NEWS/everything?q=bitcoin&apiKey=$_API_KEY';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
