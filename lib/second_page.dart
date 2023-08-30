
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
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
                      FloatingActionButton(
                        onPressed: () async{
                          final XFile xfile = await onTakePicture();
                          if(!mounted) return;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreview(xfile: xfile,)));
                        },
                        backgroundColor: Colors.amber[800],
                        child: Icon(
                          Icons.camera,
                          size: 30,
                          color: Colors.black,
                        ),
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
        cameras[EnumCameraDescripion.back.index],
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
  
  
}



enum EnumCameraDescripion {front, back}