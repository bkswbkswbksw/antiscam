import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 50, // Adjust the position of the logo as needed
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/ScamHunter.jpg',
                width: 190,
                height: 190,
              ),
            ),
          ),
          Positioned(
            top: 210, // Adjust the position of the card as needed
            left: 0,
            right: 0,
            child: 
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: 
                // Card(
                //   elevation: 6.0,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(16.0),
                  // ),
                  // child: 
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black),
                          //   borderRadius: BorderRadius.circular(8.0),
                          // ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 13, 
                            ),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none, 
                              labelStyle: TextStyle(
                                fontSize: 12, 
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black),
                          //   borderRadius: BorderRadius.circular(8.0),
                          // ),
                          child:
                          TextField(
                            style: TextStyle(
                              fontSize: 13, 
                            ),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none, 
                              labelStyle: TextStyle(
                                fontSize: 12, 
                              ),
                            ),
                            obscureText: true,
                          ), 
                        ),
                        SizedBox(height: 25.0),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Login', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.0),
                        TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password?', style: TextStyle(color: Colors.black)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?', 
                            ),
                            SizedBox(width: 4.0),
                            TextButton(
                              onPressed: () {},
                              child: Text('Sign Up', 
                              style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                // ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
