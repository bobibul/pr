import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

IconData getCameraLensIcon(CameraLensDirection direction){
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  return Icons.camera;
}

void _logError(String code, String? message) {
  //  ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}


class _CameraAppState extends State<CameraApp>
with WidgetsBindingObserver, TickerProviderStateMixin{
  CameraController? controller;
  XFile? imageFile;
  XFile? videoFile;
  VoidCallback? videoPlayerListner;
  bool enableAudio = true;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;
  late Animation<double> _focusModeControlRowAnimation;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

















  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
