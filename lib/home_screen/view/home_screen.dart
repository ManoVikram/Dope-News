import 'package:flutter/material.dart';

import '../widgets/news_card.dart';
import '../widgets/search_box.dart';

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
                Stack(
                  children: List.generate(
                    5,
                    (index) => NewsCard(
                      size: size,
                      imageURL:
                          "https://cdn.vox-cdn.com/thumbor/MuJUSwI3H6Yz5WOM-S05QhyQPaE=/0x0:1920x1080/1400x1400/filters:focal(960x540:961x541)/cdn.vox-cdn.com/uploads/chorus_asset/file/24004354/Celebrating_Steve___October_5___Apple_0_54_screenshot.png",
                      newsURL:
                          "https://newsapi.org/docs/endpoints/top-headlines",
                      title: "Steve Jobs",
                      description:
                          "In 1996, Apple announced that it would buy NeXT for \$427 million. The deal was finalized in February 1997,[142] bringing Jobs back to the company he had cofounded. Jobs became de facto chief after then-CEO Gil Amelio was ousted in July 1997. In 1996, Apple announced that it would buy NeXT for \$427 million. The deal was finalized in February 1997,[142] bringing Jobs back to the company he had cofounded. Jobs became de facto chief after then-CEO Gil Amelio was ousted in July 1997.",
                      from: "CNN News",
                      isFront: index == 4 ? true : false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
