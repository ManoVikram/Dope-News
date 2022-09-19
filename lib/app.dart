import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import './constants.dart';
import './home_screen/providers/news_card_position_provider.dart';
import './home_screen/blocs/bloc.dart';
import './home_screen/view/home_screen.dart';
import './home_screen/repositories/repositories.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final NewsRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(repository: repository)..add(const FetchTopNews()),
      child: ChangeNotifierProvider(
        create: (context) => NewsCardPositionProvider(),
        child: MaterialApp(
          title: "News App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: primaryColor,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
