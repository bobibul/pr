import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/camera_page.dart';

class MyHome extends StatelessWidget {


  const MyHome({super.key});

  Future<void> requestCameraPermission() async{

    final status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
    } else if (status == PermissionStatus.denied) {
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    requestCameraPermission();
     return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/KakaoTalk_20230913_191207447.png'),
                    radius: 60.0,
                    backgroundColor: Colors.white),
              ),
              Center(
                child: Divider(
                  height: 60.0,
                  color: Colors.blueAccent[700],
                  thickness: 5.0,
                  endIndent: 0.0,
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    // border: Border.all(color: Colors.black, width: 6)
                ),
                child: Text(
                  '치아 색 분석기',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      fontFamily: '채경폰트',
                      letterSpacing: 2.0,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold),
                ),
              ),


              SizedBox(
                height: 90,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode_outlined, size: 38,
                  color: Colors.red),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    '밝은 환경에서 촬영해주세요',
                    style: TextStyle(
                        fontFamily: '진혁폰트',
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/KakaoTalk_20230913_195848277.png'),
                    radius: 18.0,
                    backgroundColor: Colors.white
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    '5M3 샘플을 준비해주세요',
                    style: TextStyle(
                        fontFamily: '진혁폰트',
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 80,
              ),

              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        '준비완료 시 오른쪽 버튼',
                        style: TextStyle(
                            fontFamily: '진혁폰트',
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        ' 클릭',

                        style: TextStyle(color: Colors.blueAccent[700],
                            fontFamily: '진혁폰트',
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  FloatingActionButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraApp()));
                  },
                    backgroundColor: Colors.blueAccent[700],
                    child: Icon(Icons.camera_alt, size: 30,color: Colors.white),)
                ],
              ),

            ],
          )),
    );




  }



}