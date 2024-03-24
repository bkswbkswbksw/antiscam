import 'package:antiscam/Login.dart';
import 'package:antiscam/Register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RegisterLogin());
}

// class RegisterLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Page',
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: RegisterLogin(),
//     );
//   }
// }

class RegisterLogin extends StatelessWidget {
  const RegisterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/SH_logo.png',
                  width: 190,
                  height: 190,
                ),
              ),
            ),
            Positioned(
              top: 210,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Join Us & Get Yourself Protected!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 40.0),
                                  Container(),
                                  const SizedBox(height: 25.0),
                                  Container(),
                                  const SizedBox(height: 25.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Text('Login',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  const SizedBox(height: 20.0),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      padding: const EdgeInsets.all(16.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        side: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    child: const Text('Register',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
