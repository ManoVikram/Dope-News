part of './news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsFetchingInProcess extends NewsState {
  const NewsFetchingInProcess();
}

class TopNewsFetchingDone extends NewsState {
  const TopNewsFetchingDone({required this.topNews});

  final List<News> topNews;

  @override
  List<Object> get props => [topNews];
}

class SearchNewsFetchingDone extends NewsState {
  const SearchNewsFetchingDone({required this.searchNews});

  final List<News> searchNews;

  @override
  List<Object> get props => [searchNews];
}

class NewsFetchingError extends NewsState {
  const NewsFetchingError();
}
