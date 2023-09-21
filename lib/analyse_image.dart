import 'dart:ffi';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:image/image.dart' as im;


Map<String,double> output1 = {
  '1m1': 24.349192426422025,
  '1m2': 24.347305194619896,
  '2l1_5': 25.28112549499308,
  '2l2_5': 24.660479672958836,
  '2m1': 24.67094068185797,
  '2m2': 24.620447750491415,
  '2m3': 24.66770331578886,
  '2r1_5': 24.28761598754197,
  '2r2_5': 25.157674191211285,
  '3l1_5': 24.191673328853085,
  '3l2_5': 24.763933352273252,
  '3m1': 24.134101857358935,
  '3m2': 25.019947268652032,
  '3m3': 25.27633872387339,
  '3r1_5': 24.287717454322973,
  '3r2_5': 24.967669886205787,
  '4l1_5': 24.396333249920094,
  '4l2_5': 24.750694804881583,
  '4m1': 24.067944755305714,
  '4m2': 24.510483971261078,
  '4m3': 26.269376462697434,
  '4r1_5': 24.33228449282147,
  '4r2_5': 24.75328963473895,
  '5m1': 24.129652025875124,
  '5m2': 25.910763426695116,
};



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
    print('qqqqqqqqq');
    print(widget.position1);
    print(widget.position1.dx);

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
