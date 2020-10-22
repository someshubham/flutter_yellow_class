import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yellow_class/di/injector.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: AspectRatio(
            aspectRatio: 3 / 4, child: CameraPreview(_cameraController)),
      ),
    );
  }
}
