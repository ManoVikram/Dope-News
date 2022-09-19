import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './news_card.dart';
import './basic_news_card.dart';
import './app_web_view.dart';
import '../providers/news_card_position_provider.dart';

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
      onTap: () {
        // BlocProvider.of<NewsBloc>(context, listen: false)
        //     .add(const RemoveNews());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppWebView(url: widget.newsURL),
          ),
        );
      },
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

        provider.endPosition(context);
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
              duration:
                  Duration(milliseconds: provider.isBeingDragged ? 0 : 300),
              transform: rotatedMatrix4
                ..translate(provider.position.dx, provider.position.dy),
              child: child,
            );
          });
        },
        child: BasicNewsCard(
          size: size,
          widget: widget,
        ),
      ),
    );
  }
}
