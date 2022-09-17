import 'package:flutter/material.dart';

class NewsCardPositionProvider extends ChangeNotifier {
  Offset _position = Offset.zero;

  Offset get position => _position;

  void startPosition(DragStartDetails details) {}

  void updatePosition(DragUpdateDetails detials) {}

  void endPosition() {}
}
