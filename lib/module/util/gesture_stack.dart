import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yellow_class/module/yellow_video/video_bloc.dart';

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class GestureStack extends StatefulWidget {
  final Widget backgroundChild;
  final Widget foregroundChild;
  final VideoBloc videoBloc;

  const GestureStack({
    Key key,
    @required this.backgroundChild,
    @required this.foregroundChild,
    @required this.videoBloc,
  }) : super(key: key);

  @override
  _GestureStackState createState() => _GestureStackState();
}

class _GestureStackState extends State<GestureStack> {
  DragStartDetails startVerticalDragDetails;
  DragUpdateDetails updateVerticalDragDetails;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: height,
          width: double.infinity,
          child: widget.backgroundChild,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
              onVerticalDragStart: (dragDetails) {
                startVerticalDragDetails = dragDetails;
              },
              onVerticalDragUpdate: (dragDetails) {
                updateVerticalDragDetails = dragDetails;
              },
              onVerticalDragEnd: (endDetails) {
                double dy = updateVerticalDragDetails.globalPosition.dy -
                    startVerticalDragDetails.globalPosition.dy;

                if (dy < 0) {
                  print("Swipe Up");
                  widget.videoBloc.increaseVolume();
                } else {
                  print("Swipe Down");
                  widget.videoBloc.decreaseVolume();
                }
              },
              child: Container(
                color: Colors.transparent,
                width: width * 0.4,
                height: height,
              )),
        ),
        Container(
          height: height,
          width: double.infinity,
          child: widget.foregroundChild,
        ),
      ],
    );
  }
}
