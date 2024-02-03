import 'package:news_app/datasources/remote/dio/dio_News.dart';

import '../models/article.dart';

Future<List<Article>> getArticlesOf(String category) async {
  final response =
      await DioNews.getNewsData(url: "v2/top-headlines", queryParameters: {
    "country": "us",
    "category": category,
    "apiKey": "6e7d5ca117ef4d12bd414038ee1a81dd"
  });
  List art = response["articles"] as List;
  return art.map((e) => Article.fromJson(e)).toList();
}

Future<List<Article>> search(String q) async {
  final response = await DioNews.getNewsData(
      url: "v2/everything",
      queryParameters: {"q": q, "apiKey": "6e7d5ca117ef4d12bd414038ee1a81dd"});
  List art = response["articles"] as List;
  return art.map((e) => Article.fromJson(e)).toList();
}
