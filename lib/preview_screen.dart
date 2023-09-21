import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:untitled/drag_and_drop.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';



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


class ImagePreview extends StatefulWidget {


  final img.Image croppedImage;
  final XFile xFile;
  const ImagePreview({super.key, required this.croppedImage, required this.xFile});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RepaintBoundary(
                  child: Image.memory(Uint8List.fromList(img.encodePng(widget.croppedImage)))
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.keyboard_return,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10,),
                FloatingActionButton(
                  onPressed: () async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Croppingimage(xfile: widget.xFile)));
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


