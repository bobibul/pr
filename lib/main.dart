import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jinjin',
      home: MyPage2(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('jinhyuk'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(

        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/tooth_outline_icon_139122.png'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            Text('NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('JinHyuk',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('한국어',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('유진혁',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('using lightsaver',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                ),)
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('face',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),)
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('fire',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),)
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/tooth_outline_icon_139122.png'),
                radius: 40.0,
                backgroundColor: Colors.amber[800],
              ),
            )
          ],
        )
      ),
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
                currentAccountPicture:CircleAvatar(
                  backgroundImage: AssetImage('assets/tooth_outline_icon_139122.png'),
                  backgroundColor: Colors.white,
                ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/tooth_outline_icon_139122.png'),
                  backgroundColor: Colors.white,
                )
              ],
              accountName: Text('gdgd'),
              accountEmail: Text('oiwfhu@gmail.com'),
              onDetailsPressed: (){
                  print('arrow is clcked');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.grey[850],),
              title: Text('Home'),
              onTap: (){
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.grey[850],),
              title: Text('Settings'),
              onTap: (){
                print('setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.grey[850],),
              title: Text('Q&A'),
              onTap: (){
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

class MyPage2 extends StatelessWidget {
  const MyPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack bar'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            print("elevation button is pressed");
          },
          style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 15,
            color: Colors.white)
          ), backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
          child: Text('Elevated Button'),
        ),
      ),
    );
  }
}
