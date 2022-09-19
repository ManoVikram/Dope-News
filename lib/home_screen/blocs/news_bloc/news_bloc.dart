import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

part './news_event.dart';
part './news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc({required this.repository}) : super(const NewsInitial()) {
    on<FetchTopNews>(fetchTopNews);
    on<SearchNews>(searchNews);
    on<RemoveNews>(removeNews);
  }

  List<News> news = [];

  Future<void> fetchTopNews(FetchTopNews event, Emitter<NewsState> emit) async {
    emit(const NewsFetchingInProcess());

    try {
      news = await repository.fetchTopNews();

      emit(NewsFetchingDone(news: news));
    } catch (error) {
      print(error);

      emit(const NewsFetchingError());
    }
  }

  Future<void> searchNews(SearchNews event, Emitter<NewsState> emit) async {
    emit(const NewsFetchingInProcess());

    try {
      news = await repository.fetchSearchNews(event.searchTerm);

      emit(NewsFetchingDone(news: news));
    } catch (error) {
      print(error);

      emit(const NewsFetchingError());
    }
  }

  Future<void> removeNews(RemoveNews event, Emitter<NewsState> emit) async {
    if (news.isNotEmpty) {
      emit(
        NewsFetchingDone(news: List.of(news)..removeLast()),
      );

      news.removeLast();
    }
  }
}
