import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc.dart';
import '../widgets/news_card.dart';
import '../widgets/search_box.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBox(searchController: _searchController),
                const SizedBox(height: 20.0),
                const Text(
                  "Top News",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    /* if (state is NewsInitial) {
                      BlocProvider.of<NewsBloc>(context)
                          .add(const FetchTopNews());
                    } */

                    if (state is NewsFetchingError) {
                      return const Center(
                        child: Text(
                          'Something went wrong! Couldn\'t fetch News!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      );
                    }

                    if (state is NewsFetchingDone) {
                      return state.news.isEmpty
                          ? const Center(
                              child: Text(
                                "Oops... No more NEWS for today!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: secondaryColor,
                                ),
                              ),
                            )
                          : Stack(
                              children: state.news
                                  .map(
                                    (news) => NewsCard(
                                      size: size,
                                      imageURL: news.imageURL,
                                      newsURL: news.newsURL,
                                      title: news.title,
                                      description: news.description,
                                      from: news.from,
                                      isFront: state.news.last == news,
                                    ),
                                  )
                                  .toList(),
                            );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
