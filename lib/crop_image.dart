import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Croppingimage extends StatefulWidget {

  final XFile xfile;
  const Croppingimage({required this.xfile, super.key});


  @override
  State<Croppingimage> createState() => _CroppingimageState();
}

class _CroppingimageState extends State<Croppingimage> {

  Offset _position = Offset(150,450);

  void _updatePosition(Offset newPosition){
    setState(() {
      _position = newPosition;
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
                SizedBox(height: 100,),
                Image.file(File(widget.xfile.path)),
              ],
            ),
            Positioned(
                left: _position.dx,
                top: _position.dy,
                child: DraggableBox(
                  updatePosition: _updatePosition
                )),

          ],
          
          
        ),
      ),

    );
  }


}

class DraggableBox extends StatefulWidget {
  final void Function(Offset) updatePosition;

  const DraggableBox({required this.updatePosition, super.key});

  @override
  State<DraggableBox> createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  Offset _offset = Offset(150,450);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _offset += details.delta;
        });
        widget.updatePosition(_offset);
      },
      child: Cir(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Text('x : $_offset'),
      ),
    );
  }
}
