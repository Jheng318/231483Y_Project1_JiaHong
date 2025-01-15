import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/pages/signUp.dart';
import 'pages/login.dart';
import 'pages/signUp.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
