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

  List<Color> stack1 = [Colors.red, Colors.blue];
  List<Color> stack2 = [Colors.green];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildStack(stack1),
            buildStack(stack2)
          ],
        ),
      ),
    );
  }

  Widget buildStack(List<Color> stack) => Container(
    color: Colors.black,
    width: 200,
    height: 200,
    child: const Center(child: Text('Empty')),
  );

}
