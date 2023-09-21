import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/preview_screen.dart';
import 'package:image/image.dart' as img;


Future<XFile> saveImageToXFile(img.Image image) async {
  // Convert img.Image to Uint8List
  Uint8List pngBytes = img.encodePng(image);

  // Get the directory for saving the image
  final directory = await getTemporaryDirectory();
  String filePath = '${directory.path}/image.png';

  // Save the image to a file
  File imageFile = File(filePath);
  await imageFile.writeAsBytes(pngBytes);

  // Return as XFile
  return XFile(filePath);
}

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});


  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  int _currentCameraIndex = 1;

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
                  Image.asset('assets/overlay_cc2.png'),
                  Column(
                    children: [
                      SizedBox(height: 600,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              img.Image croppedImage;
                              if (_currentCameraIndex == 1){
                                croppedImage = await getfrontImagesize(xfile);
                              }
                              else{
                                croppedImage = await getbackImagesize(xfile);
                              }
                              final XFile rexfile = await saveImageToXFile(croppedImage);
                              if(!mounted) return;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreview(croppedImage: croppedImage,xFile: rexfile,)));
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
        ResolutionPreset.max,
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

  Future<img.Image> getfrontImagesize(XFile xfile) async{
    String imagePath = xfile.path;
    final bytes = await File(imagePath).readAsBytes();
    final img.Image? decodedImage = img.decodeImage(bytes);
    print(decodedImage!.width);
    print(decodedImage!.height);
    img.Image croppedImage = img.copyCrop(decodedImage!, x: 20, y: 530, width: decodedImage!.width - 40, height: 450);
    Image croppedFlutterImage = Image.memory(Uint8List.fromList(img.encodePng(croppedImage)));
    return croppedImage;
  }

  Future<img.Image> getbackImagesize(XFile xfile) async{
    String imagePath = xfile.path;
    final bytes = await File(imagePath).readAsBytes();
    final img.Image? decodedImage = img.decodeImage(bytes);
    print(decodedImage!.width);
    print(decodedImage!.height);
    img.Image croppedImage = img.copyCrop(decodedImage!, x: 20, y: 1000, width: decodedImage!.width - 40, height: 1000);
    Image croppedFlutterImage = Image.memory(Uint8List.fromList(img.encodePng(croppedImage)));
    return croppedImage;
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

