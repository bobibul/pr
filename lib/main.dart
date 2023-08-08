import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jinjin',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: 120,
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
                        context, MaterialPageRoute(builder: (context) => SecondPage()));
                  },
                    backgroundColor: Colors.black,
                    child: Icon(Icons.camera_alt,size: 30),)
                ],
              )
            ],
          )),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('shop buttin is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                AssetImage('assets/tooth_outline_icon_139122.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/tooth_outline_icon_139122.png'),
                  backgroundColor: Colors.white,
                )
              ],
              accountName: Text('gdgd'),
              accountEmail: Text('oiwfhu@gmail.com'),
              onDetailsPressed: () {
                print('arrow is clcked');
              },
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Settings'),
              onTap: () {
                print('setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: () {
                print('q is clicked');
              },
              trailing: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
