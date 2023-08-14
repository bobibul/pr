import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';


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
                Image.asset('assets/camera-overlay-conceptcoder.png'),
                Column(
                  children: [
                    SizedBox(height: 600,),
                    InkWell(
                      onTap: () => onTakePicture(),
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 30.0
                      ),
                    ),

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

  void onTakePicture() async{
    await controller.takePicture().then((XFile xfile) {
      if (mounted){
        if(xfile != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('ㅎㅇ'),
              content: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: Image.file(
                              File(xfile.path)
                            ).image,
                          ),
                          Icon(Icons.check)

                      ],
                    ),
                  ),
                ],

              )
            )
            );
        }
        return;
      }
    });
  }
}

enum EnumCameraDescripion {front, back}
