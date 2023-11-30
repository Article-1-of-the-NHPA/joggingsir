import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/runpage.dart';
import 'package:joggigsir/routelist.dart';
import 'package:joggigsir/running_data.dart';
import 'package:shake/shake.dart';

class RouteDetail extends StatefulWidget {
  final int _currentIndex = 1;
  final RunningData runningData;

  const RouteDetail({Key? key, required this.runningData}) : super(key: key);

  @override
  _RouteDetailState createState() => _RouteDetailState(runningData: runningData);
}

class _RouteDetailState extends State<RouteDetail> {
  final RunningData runningData;
  late ShakeDetector shaker;

  _RouteDetailState({required this.runningData});

  @override
  void initState() {
    super.initState();
    shaker = ShakeDetector.autoStart(
      shakeSlopTimeMS: 1000, // 흔들림 감지 간격
      shakeThresholdGravity: 1.5, // // 흔들림 강도
      onPhoneShake: () {
        setState(() {
          if (mounted && runningData.isRunning && !runningData.getIsPaused) {
            runningData.setSteps(runningData.getSteps + 1);
          }
        });
      },
    );
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Route Detail',
            style: TextStyle(fontFamily: "SF-Pro", color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteList(runningData: widget.runningData),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          shape: const Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        bottomNavigationBar: MenuBottom(
          currentIndex: widget._currentIndex, runningData: widget.runningData,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 600,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/maps.png',
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '경로 상세 정보',
                  style: TextStyle(fontFamily: "SF-Pro", fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(Icons.reviews),
                    SizedBox(width: 10),
                    Text(
                      '리뷰보여주기',
                      style: TextStyle(
                        fontFamily: "SF-Pro",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RunningApp(runningData: widget.runningData),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 30),
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 0.8,
                        ),
                      ),
                      primary: Colors.white,
                    ),
                    child: const Text(
                      '시작하기',
                      style: TextStyle(
                        fontFamily: "SF-Pro",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}