import 'dart:async';
import 'package:joggigsir/runpage.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class RunningCard extends StatefulWidget {
  @override
  _RunningCardState createState() => _RunningCardState();
}

class _RunningCardState extends State<RunningCard> {
  bool isPaused = false;
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  int stepCount = 0;
  int reward = 0;
  int seconds = 0;
  late ShakeDetector shaker;

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!isPaused) {
        setState(() {});
        _updateRunningTime();
      }
    });
  }

  double calculateDistance(int steps) {
    // 걸음 수 * 0.0007km(성인 평균 보폭)
    return steps * 0.0007;
  }

  void _updateRunningTime() {
    setState(() {});
  }

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
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');

    double distance = calculateDistance(stepCount);

    return GestureDetector( // 변경: GestureDetector로 감싸기
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RunningApp()), // 변경: YourNewPage는 새 페이지의 위젯
        );
      },
      child: Container(
        height: 200,
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF57073), Color(0xFFAA5454)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '🏃 마포대교',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    toggleButton(),
                  ],
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        formattedTime,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '7',
                              style: TextStyle(
                                  color: Colors.blue, fontFamily: 'SF Pro Text'),
                            ),
                            TextSpan(
                              text: '명이 함께 달리고 있어요!',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'SF Pro Text'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    indicatorCard('👟${distance.toStringAsFixed(2)}', 'km'),
                    indicatorCard('👣$stepCount', '걸음수'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget indicatorCard(String value, String unit) {
    return Container(
      width: 100,
      height: 30,
      child: Card(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value),
              Text(unit),
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPaused = !isPaused;
          if (!isPaused) {
            _stopwatch.start();
            shaker.startListening();
          } else {
            _stopwatch.stop();
            shaker.stopListening();
          }
        });
      },
      child: Container(
        width: 40,
        height: 40,
        child: Card(
          child: Center(
            child: Icon(
              isPaused ? Icons.play_arrow : Icons.pause,
            ),
          ),
        ),
      ),
    );
  }
}
