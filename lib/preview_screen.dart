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
            SizedBox(height: 300,),
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.4, // 아래쪽 부분을 자름
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.8, // 위쪽 부분을 자름
                    child: Image.file(File(xfile.path)), // 이미지 경로 수정
                  ),
                ),
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
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Croppingimage(xfile: xfile,))
                    );
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


