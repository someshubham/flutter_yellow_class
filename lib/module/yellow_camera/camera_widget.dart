import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yellow_class/di/injector.dart';
import 'dart:math' as math;

import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

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
                      width: 110,
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

class YellowCamera extends StatefulWidget {
  @override
  _YellowCameraState createState() => _YellowCameraState();
}

class _YellowCameraState extends State<YellowCamera> {
  final _cameraList = locator<List<CameraDescription>>();
  CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  _initCamera() {
    _cameraController =
        CameraController(_cameraList[1], ResolutionPreset.medium);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }
    return Transform.rotate(
      angle: -math.pi / 2,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CameraPreview(_cameraController)),
      ),
    );
  }
}
