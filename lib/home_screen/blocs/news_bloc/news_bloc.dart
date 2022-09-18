import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part './news_event.dart';
part './news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsInitial()) {
    on<NewsEvent>(fetchTopNews);
    on<NewsEvent>(searchNews);
  }

  Future<void> fetchTopNews(NewsEvent event, Emitter<NewsState> emit) async {
    emit(const NewsFetchingInProcess());
  }

  Future<void> searchNews(NewsEvent event, Emitter<NewsState> emit) async {
    emit(const NewsFetchingInProcess());
  }
}
