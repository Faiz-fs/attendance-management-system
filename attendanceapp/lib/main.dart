import 'package:attendanceapp/screens/login_page.dart';
import 'package:attendanceapp/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Attendance App",
      theme: ThemeData(primaryColor: Color.fromARGB(255, 244, 95, 95)),
      home: SplashScreen(),
    );
  }
}
