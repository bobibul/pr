import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:image/image.dart' as im;

class AnalyseImage extends StatefulWidget {

  final XFile xfile;
  final Offset position1;
  final Offset position2;

  AnalyseImage({
    required this.xfile,
    required this.position2,
    required this.position1,
    super.key});


  @override
  State<AnalyseImage> createState() => _AnalyseImageState();
}

class _AnalyseImageState extends State<AnalyseImage> {



  List<double> _centerHSV = [0.0,0.0,0.0];


  Future<void> imagetoHSV() async{
    final path = widget.xfile.path;
    final file = File(path);

    im.Image? image = im.decodeImage(file.readAsBytesSync());
    final data = image?.getBytes();
    var color = 0;


    for (int i=0;i<data!.length; i += 4){
      final int r = data[i];
      final int g = data[i+1];
      final int b = data[i+2];

    }
    print(image?.width);
    print(image?.height);
    print(data.length);

  }



  @override
  void initState(){
    super.initState();
    imagetoHSV();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black, width: 6)
                ),
                child: Text(
                  '분석 결과',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),


              SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '당신의 치아 색은...',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black, width: 6)
                ),
                child: Text(
                  '2M1',
                  textAlign: TextAlign.center,

                  style: TextStyle(color: Colors.amber[200],
                      letterSpacing: 2.0,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '입니다',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );

  }
}
