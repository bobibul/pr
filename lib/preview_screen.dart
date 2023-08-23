import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:untitled/crop_image.dart';

class ImagePreview extends StatelessWidget {

  final XFile xfile;
  const ImagePreview({required this.xfile,super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      body: Center(
        child: Column(
          children: [
            Image.file(File(xfile.path)),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.amber[800],
                  child: Icon(
                    Icons.keyboard_return,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10,),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Croppingimage(xfile: xfile,))
                    );
                  },
                  backgroundColor: Colors.amber[800],
                  child: Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.white,
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

class TotalImage extends StatelessWidget {

  final XFile xfile;
  const TotalImage({required this.xfile,super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

