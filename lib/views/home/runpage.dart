import 'package:flutter/material.dart';
import 'dart:async';
import 'package:joggigsir/views/home/mainpage.dart';
import 'package:joggigsir/data_provider/running_data.dart';
import 'package:provider/provider.dart';
import 'package:joggigsir/data_provider/shaker_provider.dart';


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

  _RunningScreenState({required this.runningData});


  @override
  void initState() {
    super.initState();
    runningData.startTimer();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateUI();
    });
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
    } else {
      _stopwatch.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = Duration(seconds: runningData.getTime).toString().split('.').first.padLeft(8, '0');
    double distance = runningData.getDistance;
    final shakeDetectorProvider = Provider.of<ShakeDetectorProvider>(context);

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
                      runningData.initializeData();
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
