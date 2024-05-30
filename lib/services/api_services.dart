import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/constant.dart';
import '../model/top_headline_model.dart';
import '../model/search_model.dart' as search;

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Articles>> getArticle() async {
    final queryParameters = {'country': 'in', 'apiKey': APIKEY};
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    print('url: $uri');

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<Articles> articles = body.map((dynamic item) => Articles.fromJson(item)).toList();
        return articles;
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      print('getArticle error: $e');
      throw e;
    }
  }


  Future<List<search.Articles>> getSearchNews(String query) async {
    final String baseUrl = 'https://newsapi.org/v2/everything?q=$query&apiKey=$APIKEY';
    print('url: $baseUrl');

    try {
      final response = await client.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<search.Articles> articles = body.map((dynamic item) => search.Articles.fromJson(item)).toList();
        return articles;
      } else {
        throw Exception('Failed to load search news');
      }
    } catch (e) {
      print('getSearchNews error: $e');
      throw e;
    }
  }
}
