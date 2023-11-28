import 'dart:async';
import 'package:joggigsir/runpage.dart';
import 'package:flutter/material.dart';

class RunningCard extends StatefulWidget {
  @override
  _RunningCardState createState() => _RunningCardState();
}

class _RunningCardState extends State<RunningCard> {
  bool isPlaying = false;
  int seconds = 0;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
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
                        formatTime(seconds),
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
                    indicatorCard('👟10.9', 'km'),
                    indicatorCard('👣3432', '걸음수'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget toggleButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
          if (isPlaying) {
            startTimer();
          } else {
            stopTimer();
          }
        });
      },
      child: Container(
        width: 40,
        height: 40,
        child: Card(
          child: Center(
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
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

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    return '$hours : ${minutes < 10 ? '0$minutes' : '$minutes'} : ${remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds'}';
  }
}

class YourNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your New Page'),
      ),
      body: Center(
        child: Text('Welcome to Your New Page!'),
      ),
    );
  }
}

