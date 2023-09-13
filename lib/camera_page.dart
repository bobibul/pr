
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:untitled/preview_screen.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});


  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  int _currentCameraIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        leadingWidth: 0.0,
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
                  Image.asset('assets/teeth_overlay_2.png'),
                  Column(
                    children: [
                      SizedBox(height: 600,),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: _toggleCamera,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.cameraswitch,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () async{
                              final XFile xfile = await onTakePicture();
                              if(!mounted) return;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreview(xfile: xfile,)));
                            },
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.camera,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )

                    ],
                  )
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
        cameras[_currentCameraIndex],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420
    );
    await controller.initialize();
  }

  Future<XFile> onTakePicture() async{
    controller.setFocusMode(FocusMode.locked);
    controller.setExposureMode(ExposureMode.locked);
    final XFile xfile = await controller.takePicture();
    controller.setFocusMode(FocusMode.auto);
    controller.setExposureMode(ExposureMode.auto);

    return xfile;
  }

  void _toggleCamera(){
    setState(() {
      if(_currentCameraIndex == 0){
        _currentCameraIndex = 1;
      }
      else{
        _currentCameraIndex = 0;
      }
    });
  }
  
  
}

