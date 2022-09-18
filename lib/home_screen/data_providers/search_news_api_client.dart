import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';
import '../../secrets.dart';

class SearchNewsAPIClient {
  const SearchNewsAPIClient({required this.httpClient});

  final http.Client httpClient;

  Future<List<News>> fetchSearchNews(String searchTerm) async {
    final String _apiURL =
        "https://newsapi.org/v2/top-headlines?q=$searchTerm&apiKey=$apiKey";

    final Uri uri = Uri.parse(_apiURL);

    final http.Response response = await httpClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Error while fetching search news from the API!");
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
