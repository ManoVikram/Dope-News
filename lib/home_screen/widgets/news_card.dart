import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
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

class FrontNewsCard extends StatelessWidget {
  const FrontNewsCard({
    Key? key,
    required this.size,
    required this.widget,
  }) : super(key: key);

  final Size size;
  final NewsCard widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onPanStart: (DragStartDetails details) {
        final NewsCardPositionProvider provider =
            Provider.of<NewsCardPositionProvider>(context, listen: false);

        provider.startPosition(details);
      },
      onPanUpdate: (DragUpdateDetails details) {
        final NewsCardPositionProvider provider =
            Provider.of<NewsCardPositionProvider>(context, listen: false);

        provider.updatePosition(details);
      },
      onPanEnd: (DragEndDetails details) {
        final NewsCardPositionProvider provider =
            Provider.of<NewsCardPositionProvider>(context, listen: false);

        provider.endPosition();
      },
      child: Consumer<NewsCardPositionProvider>(
          builder: (context, provider, child) {
        return LayoutBuilder(builder: (context, constraints) {
          final double rotationAngle = provider.angle * (pi / 180);
          final Offset center = constraints.smallest.center(Offset.zero);
          final Matrix4 rotatedMatrix4 = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(rotationAngle)
            ..translate(-center.dx, -center.dy);

          return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: provider.isBeingDragged ? 0 : 300),
            transform: rotatedMatrix4
              ..translate(provider.position.dx, provider.position.dy),
            child: BasicNewsCard(
              size: size,
              widget: widget,
            ),
          );
        });
      }),
    );
  }
}

class BasicNewsCard extends StatelessWidget {
  const BasicNewsCard({
    Key? key,
    required this.size,
    required this.widget,
  }) : super(key: key);

  final Size size;
  final NewsCard widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.7,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    image: DecorationImage(
                      image: NetworkImage(widget.imageURL),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        widget.description,
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.75,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        if (widget.isFront)
          RichText(
            text: TextSpan(
              text: "From ",
              style: const TextStyle(color: secondaryColor),
              children: [
                TextSpan(
                  text: widget.from,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
