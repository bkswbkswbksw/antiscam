import 'package:antiscam/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fool Me Once, Shame On You',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: SplashScreen(),
    );
  }
}
