import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './basic_news_card.dart';
import './front_news_card.dart';
import '../models/providers/news_card_position_provider.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    Key? key,
    required this.size,
    required this.imageURL,
    required this.newsURL,
    required this.title,
    required this.description,
    required this.from,
    required this.isFront,
  }) : super(key: key);

  final Size size;
  final String imageURL;
  final String newsURL;
  final String title;
  final String description;
  final String from;
  final bool isFront;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Size size = MediaQuery.of(context).size;

      final NewsCardPositionProvider provider =
          Provider.of<NewsCardPositionProvider>(context, listen: false);

      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return widget.isFront
        ? FrontNewsCard(size: size, widget: widget)
        : BasicNewsCard(size: size, widget: widget);
  }
}
