import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:async';
import 'package:joggigsir/mainpage.dart';
import 'package:joggigsir/running_data.dart';


class RunningApp extends StatelessWidget {
  final RunningData runningData;
  const RunningApp({Key? key, required this.runningData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFF6464),
      ),
      home: RunningScreen(runningData: runningData),
    );
  }
}

class RunningScreen extends StatefulWidget {
  final RunningData runningData;
  const RunningScreen({Key? key, required this.runningData}) : super(key: key);

  @override
  _RunningScreenState createState() => _RunningScreenState(runningData: runningData);
}

class _RunningScreenState extends State<RunningScreen> {
  final RunningData runningData;
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  late ShakeDetector shaker;

  _RunningScreenState({required this.runningData});


  @override
  void initState() {
    super.initState();
    runningData.startTimer();
    shaker = ShakeDetector.autoStart(
      shakeSlopTimeMS: 500,
      shakeThresholdGravity: 1.5,
      onPhoneShake: () {
        if (mounted && runningData.getIsRunning && !runningData.getIsPaused) {
          setState(() {
            runningData.setSteps(runningData.getSteps + 1);
          });
        }
      },
    );
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateUI();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 페이지가 활성화될 때 ShakeDetector 리스너를 시작
    shaker.startListening();
  }

  @override
  void dispose() {
    // 페이지가 비활성화될 때 ShakeDetector 리스너를 중지
    shaker.stopListening();
    super.dispose();
  }

  void _updateUI() {
    if (mounted) {
      setState(() {});
    }
  }

  void _togglePause() {
    runningData.toggleIsPaused();
    if (runningData.getIsPaused) {
      _stopwatch.stop();
      shaker.stopListening();
    } else {
      _stopwatch.start();
      shaker.startListening();
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = Duration(seconds: runningData.getTime).toString().split('.').first.padLeft(8, '0');
    double distance = runningData.getDistance;

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
                builder: (context) => MainPage(runningData: runningData),
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
                '${runningData.getSteps}',
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
                '${runningData.getReward}',
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
                          runningData.getIsPaused ? Icons.play_arrow : Icons.pause,
                          color: const Color(0xFF2B2B2B),
                          size: 40,
                        ),
                      ),
                    ),
                  ),

                  // 네모 아이콘 버튼
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(runningData: runningData),
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
