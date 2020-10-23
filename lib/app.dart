import 'package:flutter/material.dart';
import 'package:flutter_yellow_class/module/yellow_camera/camera_widget.dart';
import 'package:video_player/video_player.dart';

import 'module/util/gesture_stack.dart';
import 'module/yellow_video/video_bloc.dart';
import 'module/yellow_video/video_widget.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  VideoBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = VideoBloc()
      ..initVideoController().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        bloc.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureStack(
        videoBloc: bloc,
        backgroundChild: YellowVideo(
          controller: bloc.controller,
        ),
        foregroundChild: MovableCamera(),
      ),
    );
  }
}
