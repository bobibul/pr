import 'package:flutter/material.dart';
import 'package:untitled/my_home.dart';
import 'package:untitled/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isLogin = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
      body: _isLogin? MyHome() : Login()
    ));
  }
}
