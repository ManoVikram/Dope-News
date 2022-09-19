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

class NewsFetchingDone extends NewsState {
  const NewsFetchingDone({required this.news});

  final List<News> news;

  @override
  List<Object> get props => [news];
}

class NewsFetchingError extends NewsState {
  const NewsFetchingError();
}
