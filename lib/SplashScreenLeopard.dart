import 'dart:async';
import 'package:antiscam/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start timer to change images every 2 seconds
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 2;
      });
    });

    // Redirect to home screen after 4 seconds (2 seconds for each image)
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: _currentIndex == 0
              ? Image(
                  key: UniqueKey(),
                  image: AssetImage('assets/logoHunter5.png'),
                  fit: BoxFit.cover,
                )
              : Image(
                  key: UniqueKey(),
                  image: AssetImage('assets/logoHunter4.png'),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to your home screen!'),
      ),
    );
  }
}
