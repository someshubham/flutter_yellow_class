import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

class VideoBloc {
  VideoPlayerController _videoController;
  double volume = 0.5;
  VideoBloc() {
    _videoController = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
  }

  Future<void> initVideoController() => _videoController.initialize();

  play() {
    _videoController.play();
  }

  VideoPlayerController get controller => _videoController;

  increaseVolume() {
    if (volume <= 0.9) {
      volume += 0.1;
      print("Increase volume $volume");
      Fluttertoast.showToast(
        msg: '${(volume * 10).ceil().toInt()}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black38,
        textColor: Colors.white,
      );
      _videoController.setVolume(volume);
    }
  }

  decreaseVolume() {
    if (volume >= 0.1) {
      volume -= 0.1;
      print("Decrease volume $volume");
      Fluttertoast.showToast(
        msg: '${(volume * 10).ceil().toInt()}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black38,
        textColor: Colors.white,
      );
      _videoController.setVolume(volume);
    }
  }
}
