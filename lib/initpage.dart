// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'views/home/login.dart';

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
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  Future<void> _navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));

    // Use Navigator.pushReplacement to navigate to the login page.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFC5DDFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 300.0,
              height: 300.0,
            ),
            const SizedBox(height: 16.0), // Add some space between the logo and text
            const Text(
              '조깅서',
              //'JoggingSir',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF6464), // Set text color to red
              ),
            ),
          ],
        ),
      ),
    );
  }
}

