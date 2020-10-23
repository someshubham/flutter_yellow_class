import 'package:flutter/material.dart';
import 'package:flutter_yellow_class/module/yellow_video/video_bloc.dart';
import 'package:video_player/video_player.dart';

class YellowVideo extends StatefulWidget {
  final VideoPlayerController controller;

  const YellowVideo({Key key, @required this.controller}) : super(key: key);
  @override
  _YellowVideoState createState() => _YellowVideoState();
}

class _YellowVideoState extends State<YellowVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.initialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
