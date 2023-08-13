import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';


class CameraApp extends StatefulWidget {
  const CameraApp({super.key});


  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(height: 30,),
      ),
      body: FutureBuilder(
        future: initializationCamera(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.center,
              children: [
                CameraPreview(controller),
                Image.asset('assets/camera-overlay-conceptcoder.png')
              ],
            );
          }else{
            return Center(
                child: CircularProgressIndicator()
            );
          }
        }
      ),

    );
  }

  Future<void> initializationCamera() async{
    var cameras = await availableCameras();
    controller = CameraController(
      cameras[EnumCameraDescripion.back.index],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420
    );
    await controller.initialize();
  }
}

enum EnumCameraDescripion {front, back}
