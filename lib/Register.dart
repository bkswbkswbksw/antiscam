import 'package:antiscam/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Register());
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

class Register extends StatelessWidget {
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
                          'Register',
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
                              labelText: 'Full Name',
                              prefixIcon: const Icon(Icons.person_outline),
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
                          onPressed: () {},
                          child: const Text('Register',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            const SizedBox(width: 4.0),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: const Text(
                                'Login',
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
