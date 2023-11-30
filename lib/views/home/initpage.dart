// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'login.dart';
import 'package:joggigsir/data_provider/running_data.dart';

class MyApp extends StatelessWidget {
  final RunningData runningData;
  const MyApp({Key? key, required this.runningData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(runningData: runningData),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final RunningData runningData;
  const SplashScreen({Key? key, required this.runningData}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState(runningData: runningData);
}

class _SplashScreenState extends State<SplashScreen> {
  final RunningData runningData;

  _SplashScreenState({required this.runningData});

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
        builder: (context) => LoginPage(runningData: runningData),
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

