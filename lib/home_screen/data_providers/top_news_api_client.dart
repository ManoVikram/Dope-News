import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news.dart';
import '../../secrets.dart';

class TopNewsAPIClient {
  TopNewsAPIClient({required this.httpClient});

  final http.Client httpClient;

  Future<List<News>> fetchTopNews() async {
    const String _apiURL =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";

    final Uri uri = Uri.parse(_apiURL);

    final http.Response response = await httpClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Error while fetching top news from the API!");
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<News> newsArticles = [];

    for (var news in json["articles"]) {
      final News newsArticle = News.fromJson(news);

      newsArticles.add(newsArticle);
    }

    return newsArticles;
  }
}
