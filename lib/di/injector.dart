import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class AppInjector {
  static final AppInjector _singleton = AppInjector._internal();

  factory AppInjector() => _singleton;

  AppInjector._internal();

  Future<void> configure() async {
    await _initCamera();
  }

  Future<void> _initCamera() async {
    final cameraList = await availableCameras();
    locator.registerLazySingleton<List<CameraDescription>>(
      () => cameraList,
    );
  }
}
