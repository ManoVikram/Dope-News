part of './news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchTopNews extends NewsEvent {
  const FetchTopNews();
}

class SearchNews extends NewsEvent {
  const SearchNews({required this.searchTerm});

  final String searchTerm;

  @override
  List<Object> get props => [searchTerm];
}
