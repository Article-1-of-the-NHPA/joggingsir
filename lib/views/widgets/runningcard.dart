import 'package:joggigsir/running_data.dart';
import 'package:joggigsir/runpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class RunningCard extends StatefulWidget {
  final RunningData runningData;
  final int runningman = 7;

  RunningCard({required this.runningData});

  @override
  _RunningCardState createState() => _RunningCardState(runningData: runningData);
}

class _RunningCardState extends State<RunningCard> {
  final RunningData runningData;
  Random random = Random();
  int randomNumber = 7;
  Timer? _timer;

  _RunningCardState({required this.runningData});

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateUI();
    });
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      randomNumber = random.nextInt(10) + 1;
    });
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
                              text: '$randomNumber',
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
          } else {
            runningData.stopTimer();
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
