import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'di/injector.dart';
import 'module/yellow_camera/camera_widget.dart';

void main() => mainCommon();

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('[MESSAGE] Started Configuring dependencies');
  await AppInjector().configure();
  print('[MESSAGE] Finished Configuring dependencies');

  Future<void> _reportError(dynamic error, StackTrace stackTrace) async {
    // Print the exception to the console.
    print('[ERROR] Caught error: $error');
    if (kDebugMode) {
      // Print the full stacktrace in debug mode.
      print(stackTrace);
      return;
    }
  }

  print('Starting Application');
  runZonedGuarded<Future<void>>(
    () async {
      runApp(MyApp());
    },
    _reportError,
  );
}
