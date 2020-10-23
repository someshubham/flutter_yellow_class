import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class GestureStack extends StatelessWidget {
  final Widget backgroundChild;
  final Widget foregroundChild;

  const GestureStack({
    Key key,
    @required this.backgroundChild,
    @required this.foregroundChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: backgroundChild,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: foregroundChild,
        ),
      ],
    );
  }
}
