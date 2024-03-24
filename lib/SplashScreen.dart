import 'dart:async';
import 'package:antiscam/Home.dart';
import 'package:antiscam/RegisterLogin.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 2;
      });
    });

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegisterLogin()));
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
                  image: AssetImage('assets/SH_logo.png'),
                  fit: BoxFit.cover,
                )
              : Image(
                  key: UniqueKey(),
                  image: AssetImage('assets/SH_logo_main.png'),
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
