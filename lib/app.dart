import 'package:flutter/material.dart';
import 'package:flutter_yellow_class/module/yellow_camera/camera_widget.dart';

import 'module/util/gesture_stack.dart';
import 'module/yellow_video/video_widget.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureStack(
        backgroundChild: YellowVideo(),
        foregroundChild: MovableCamera(),
      ),
    );
  }
}
