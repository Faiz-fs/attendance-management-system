// ignore_for_file: file_names

import 'dart:async';

import 'package:attendanceapp/screens/auth_page.dart';
import 'package:attendanceapp/screens/getdata.dart';
import 'package:attendanceapp/screens/login_page.dart';
import 'package:attendanceapp/screens/userinfo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), (() {
      //userinfo();
      //print(await GetData().getCurrentUserData());
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => AuthPage()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/college.png',
              height: 120,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
