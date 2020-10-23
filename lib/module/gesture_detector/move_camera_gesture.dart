import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yellow_class/module/yellow_camera/camera_widget.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class MoveTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move the text'),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            // child: MovableText(
            //   text: 'Hello',
            // ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: MovableCamera(),
          ),
        ],
      ),
    );
  }
}

class MovableCamera extends StatefulWidget {
  @override
  _MovableCameraState createState() => _MovableCameraState();
}

class _MovableCameraState extends State<MovableCamera> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return MatrixGestureDetector(
      onMatrixUpdate: (m, tm, sm, rm) {
        notifier.value = m;
      },
      focalPointAlignment: Alignment.center,
      clipChild: true,
      shouldScale: false,
      child: AnimatedBuilder(
        animation: notifier,
        builder: (ctx, child) {
          return Transform(
            transform: notifier.value,
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 160,
                      width: 125,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: YellowCamera(),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
