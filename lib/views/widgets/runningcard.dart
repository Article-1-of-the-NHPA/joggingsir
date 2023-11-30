import 'package:joggigsir/running_data.dart';
import 'package:joggigsir/runpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shake/shake.dart';

class RunningCard extends StatefulWidget {
  final RunningData runningData;

  RunningCard({required this.runningData});

  @override
  _RunningCardState createState() => _RunningCardState(runningData: runningData);
}

class _RunningCardState extends State<RunningCard> {
  final RunningData runningData;
  late ShakeDetector shaker;
  Timer? _timer;

  _RunningCardState({required this.runningData});

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



  @override
  Widget build(BuildContext context) {
    String formattedTime = Duration(seconds: runningData.getTime).toString().split('.').first.padLeft(8, '0');
    double distance = runningData.getDistance;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RunningApp(runningData: runningData)),
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
                    Text(
                      '🏃 ${runningData.getRoute}',
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
                                color: Colors.blue,
                                fontFamily: 'SF Pro Text',
                              ),
                            ),
                            TextSpan(
                              text: '명이 함께 달리고 있어요!',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF Pro Text',
                              ),
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
                    indicatorCard('👣${runningData.getSteps}', '걸음수'),
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
          runningData.toggleIsPaused();
          if (!runningData.getIsPaused) {
            runningData.startTimer();
            shaker.startListening();
          } else {
            runningData.stopTimer();
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
              runningData.getIsPaused ? Icons.play_arrow : Icons.pause,
            ),
          ),
        ),
      ),
    );
  }
}
