import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/analyse_image.dart';

class Croppingimage extends StatefulWidget {

  final XFile xfile;
  const Croppingimage({required this.xfile, super.key});


  @override
  State<Croppingimage> createState() => _CroppingimageState();
}

class _CroppingimageState extends State<Croppingimage>{

  Offset _position1 = Offset(120,750);
  Offset _position2 = Offset(240,750);
  GlobalKey imageKey = GlobalKey();
  double circleRadius = 20.0;




  void _updatePosition1(Offset newPosition){
    setState(() {
      _position1 = newPosition;
    });
  }

  void _updatePosition2(Offset newPosition){
    setState(() {
      _position2 = newPosition;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 300,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RepaintBoundary(
                    key: imageKey,
                    child: Image.file(File(widget.xfile.path)),
                  ),
                ),
              ],
            ),
            Positioned(
                left: _position1.dx,
                top: _position1.dy,
                child: DraggableBox(
                  updatePosition: _updatePosition1
                )),
            Positioned(
                left: _position2.dx,
                top: _position2.dy,
                child: DraggableBox2(
                    updatePosition: _updatePosition2
                )),
            Positioned(
                left: _position1.dx + 6,
                top: _position1.dy + 40,
                child: Text('샘플',)
            ),

            Positioned(
                left: _position2.dx + 6,
                top: _position2.dy + 40,
                child: Text('치아')
            ),
            
            Positioned(
                left: 310,
                top: 750,
                child:FloatingActionButton(
                  onPressed: _position2.dy <= 500 && _position1.dy <= 500? () {
                    cropImage();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                        AnalyseImage(
                          xfile: widget.xfile,
                          position1: _position1,
                          position2: _position2,
                        ))
                    );
                  } : null,
                  backgroundColor: _position2.dy <= 500 && _position1.dy <= 500 ? Colors.amber[800] : Colors.grey,
                  disabledElevation: 0.0,
                  foregroundColor: Colors.grey,
                  child: Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.white,
                  ),
                )
            ),


          ],
          
          
        ),
      ),

    );
  }
  void cropImage() async{
    RenderRepaintBoundary boundary =
        imageKey.currentContext!.findRenderObject() as RenderRepaintBoundary;


  }



}


class DraggableBox extends StatefulWidget {
  final void Function(Offset) updatePosition;

  const DraggableBox({required this.updatePosition, super.key});

  @override
  State<DraggableBox> createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  Offset _offset = Offset(120,750);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _offset += details.delta;
        });
        widget.updatePosition(_offset);
      },
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/circle-outline.png'),
        backgroundColor: Colors.transparent,
        radius: 20,
      ),
    );
  }
}

class DraggableBox2 extends StatefulWidget {
  final void Function(Offset) updatePosition;

  const DraggableBox2({required this.updatePosition, super.key});

  @override
  State<DraggableBox2> createState() => _DraggableBoxState2();
}

class _DraggableBoxState2 extends State<DraggableBox2> {
  Offset _offset = Offset(240,750);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _offset += details.delta;
        });
        widget.updatePosition(_offset);
      },
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/circle-outline.png'),
        backgroundColor: Colors.transparent,
      ),
    );
  }




}












