import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import './app.dart';
import './home_screen/repositories/repositories.dart';
import './home_screen/data_providers/search_news_api_client.dart';
import './home_screen/data_providers/top_news_api_client.dart';

void main() {
  final NewsRepository repository = NewsRepository(
    topNewsAPIClient: TopNewsAPIClient(httpClient: http.Client()),
    searchNewsAPIClient: SearchNewsAPIClient(httpClient: http.Client()),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(App(repository: repository));
}
