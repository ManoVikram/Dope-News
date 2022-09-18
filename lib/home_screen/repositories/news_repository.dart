import '../data_providers/search_news_api_client.dart';
import '../data_providers/top_news_api_client.dart';

import '../models/models.dart';

class NewsRepository {
  const NewsRepository({
    required this.topNewsAPIClient,
    required this.searchNewsAPIClient,
  });

  final TopNewsAPIClient topNewsAPIClient;
  final SearchNewsAPIClient searchNewsAPIClient;

  Future<List<News>> fetchTopNews() async {
    return await topNewsAPIClient.fetchTopNews();
  }

  Future<List<News>> fetchSearchNews(String searchTerm) async {
    return await searchNewsAPIClient.fetchSearchNews(searchTerm);
  }
}
