import 'package:flutter/material.dart';

import 'module/gesture_detector/move_camera_gesture.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoveTextDemo(),
    );
  }
}
