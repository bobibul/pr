import 'package:flutter/material.dart';
import 'package:untitled/my_home.dart';
import 'package:go_router/go_router.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness:  Brightness.light,
        primaryColor: Colors.amber[800],
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => NoTransitionPage(child: MyHome())
          )
        ]
      ),
    );
  }
}
