import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc.dart';

class NewsCardPositionProvider extends ChangeNotifier {
  bool _isBeingDragged = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0.0;

  Offset get position => _position;

  bool get isBeingDragged => _isBeingDragged;

  Size get screenSize => _screenSize;

  double get angle => _angle;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isBeingDragged = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails detials) {
    _position += detials.delta;

    final double x = position.dx;
    _angle = 45 * (x / screenSize.width);

    notifyListeners();
  }

  void endPosition(BuildContext context) {
    _isBeingDragged = false;
    notifyListeners();

    final double x = position.dx;
    final double y = position.dy;
    final double delta = 140.0;

    final NewsBloc bloc = context.read<NewsBloc>();

    if (x > delta) {
      _position += Offset(2 * screenSize.width, 0.0);
      bloc.add(const RemoveNews());
    } else if (x < -delta) {
      _position -= Offset(2 * screenSize.width, 0.0);
      bloc.add(const RemoveNews());
    } else if (y < -delta) {
      _position -= Offset(0.0, screenSize.height);
      bloc.add(const RemoveNews());
    }

    resetPosition();
  }

  void resetPosition() {
    _isBeingDragged = false;
    _position = Offset.zero;
    _angle = 0.0;

    notifyListeners();
  }
}
