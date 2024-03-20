import 'package:antiscam/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fool Me Once, Shame On You',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Home(), 
    );
  }
}
