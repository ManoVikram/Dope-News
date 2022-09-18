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
  const TopNewsFetchingDone();
}

class SearchNewsFetchingDone extends NewsState {
  const SearchNewsFetchingDone();
}

class NewsFetchingError extends NewsState {
  const NewsFetchingError();
}
