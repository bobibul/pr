import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/second_page.dart';

class MyHome extends StatelessWidget {


  const MyHome({super.key});

  Future<void> requestCameraPermission() async{

    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted ;

    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    requestCameraPermission();
     return Scaffold(
      backgroundColor: Colors.amber[800],
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/tooth_outline_icon_139122.png'),
                    radius: 60.0,
                    backgroundColor: Colors.amber[800]),
              ),
              Center(
                child: Divider(
                  height: 60.0,
                  color: Colors.black,
                  thickness: 10.0,
                  endIndent: 0.0,
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black, width: 6)
                ),
                child: Text(
                  '치아 색 분석기',
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

              Row(
                children: [
                  Icon(Icons.check_circle_outline, size: 40,),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '밝은 환경에서 촬영해주세요',
                    style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline, size: 40,),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '5M3 샘플을 준비해주세요',
                    style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 80,
              ),

              Row(
                children: [
                  Text(
                    '준비완료 시 오른쪽 버튼 클릭',
                    style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraApp()));
                  },
                    backgroundColor: Colors.black,
                    child: Icon(Icons.camera_alt, size: 30),)
                ],
              ),

            ],
          )),
    );




  }



}