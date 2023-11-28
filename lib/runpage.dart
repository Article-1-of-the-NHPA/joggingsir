import 'package:flutter/material.dart';
import 'dart:async';
import 'package:joggigsir/mainpage.dart';

void main() {
  runApp(const RunningApp());
}

class RunningApp extends StatelessWidget {
  const RunningApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFF6464),
      ),
      home: RunningScreen(),
    );
  }
}

class RunningScreen extends StatefulWidget {
  const RunningScreen({Key? key}) : super(key: key);

  @override
  _RunningScreenState createState() => _RunningScreenState();
}

class _RunningScreenState extends State<RunningScreen> {
  bool isPaused = false;
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  int _stepCount = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!isPaused) {
        setState(() {});
        _updateRunningTime();
      }
    });
  }

  void _updateRunningTime() {
    setState(() {});
  }

  void _resetTimer() {
    _stopwatch.reset();
    setState(() {});
  }

  void _togglePause() {
    isPaused = !isPaused;
    if (isPaused) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                formattedTime,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.32,
                ),
              ),

              SizedBox(height: 20),

              // 거리
              Text(
                '거리(km)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '5.2',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.32,
                ),
              ),

              SizedBox(height: 10),

              // 걸음수
              Text(
                '걸음수',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '$_stepCount',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.32,
                ),
              ),

              SizedBox(height: 10),

              // 적립 리워드
              Text(
                '적립 리워드',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '120',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 45,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.32,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 일시정지/재생 버튼
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _togglePause();
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        isPaused ? Icons.play_arrow : Icons.pause,
                        color: const Color(0xFF2B2B2B),
                        size: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _resetTimer(); // 변경: _resetTimer() 함수로 변경
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.stop, // 변경: 초기화 버튼을 정지 버튼으로 변경
                        color: const Color(0xFF2B2B2B),
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}