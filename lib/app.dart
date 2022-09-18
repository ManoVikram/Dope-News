import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './constants.dart';
import '../home_screen/view/home_screen.dart';
import 'home_screen/providers/news_card_position_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsCardPositionProvider(),
      child: MaterialApp(
        title: "News App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
