import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AnalyseImage extends StatefulWidget {

  final XFile xfile;
  final double offsetx1;
  final double offsetx2;
  final double offsety1;
  final double offsety2;


  const AnalyseImage({
    required this.xfile,
    required this.offsetx1,
    required this.offsetx2,
    required this.offsety1,
    required this.offsety2,
    super.key});

  @override
  State<AnalyseImage> createState() => _AnalyseImageState();
}

class _AnalyseImageState extends State<AnalyseImage> {

  late HSVColor _hsvColor = HSVColor.fromAHSV(1, 0, 0, 0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          SizedBox(height: 130,),
          Text(
            '치아 색 예측',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '$_hsvColor, $_AnalyseImageState()'
          )


        ]
      ),

    );
  }
}
