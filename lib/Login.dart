import 'package:antiscam/Home.dart';
import 'package:antiscam/Quiz.dart';
import 'package:antiscam/Register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Login());
}

// class LoginApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Page',
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: LoginPage(),
//     );
//   }
// }

class Login extends StatelessWidget {
  bool isFirstLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 40.0),
                        Container(
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email_outlined),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                              labelStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Container(
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                              labelStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        ElevatedButton(
                          onPressed: () async {
                            if (isFirstLogin) {
                              bool takeQuiz = await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Welcome!'),
                                      content: const Text(
                                          'Do you want to take a quiz to test your scam awareness level?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    ),
                                  ) ??
                                  false;

                              if (takeQuiz) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizPage()),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false,
                                );
                              }
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text('Login',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(height: 20.0),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: const Text('Forgot Password?',
                              style: TextStyle(color: Colors.black)),
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            const SizedBox(width: 4.0),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: const Text(
                                'Sign Up',
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
            ),
          ),
        ],
      ),
    );
  }
}
