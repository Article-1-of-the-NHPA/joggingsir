import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
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
  int stepCount = 0;
  int reward = 0;
  late ShakeDetector shaker;

  @override
  void initState() {
    super.initState();
    _startTimer();
     shaker = ShakeDetector.autoStart(
      shakeSlopTimeMS: 500, // 흔들림 감지 간격
      shakeThresholdGravity: 1.5, // // 흔들림 강도
      onPhoneShake: () {
        setState(() {
          stepCount++;
          if (stepCount % 100 == 0) { // 리워드: 100보마다 10씩 줌
            reward += 10;
          }
        });
      },
    );
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
      shaker.stopListening();
    } else {
      _stopwatch.start();
      shaker.startListening();
    }
  }

  // 거리 계산 함수
  double calculateDistance(int steps) {
    // 걸음 수 * 0.0007km(성인 평균 보폭)
    return steps * 0.0007;
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');

    double distance = calculateDistance(stepCount);

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
                distance.toStringAsFixed(2), // 소수점 첫째자리까지만 표시
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
                '$stepCount',
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
                '$reward',
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

              // 일시정지/재생 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 일시정지/재생 버튼
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _togglePause();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
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
                  ),

                  // 네모 아이콘 버튼
                  GestureDetector(
                    onTap: () {
                      _resetTimer();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.stop,
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