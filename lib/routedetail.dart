import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/runpage.dart';
import 'package:joggigsir/routelist.dart';
import 'package:joggigsir/running_data.dart';

class RouteDetail extends StatefulWidget {
  final int _currentIndex = 1;
  final RunningData runningData;

  const RouteDetail({Key? key, required this.runningData}) : super(key: key);

  @override
  _RouteDetailState createState() => _RouteDetailState(runningData: runningData);
}

class _RouteDetailState extends State<RouteDetail> {
  final RunningData runningData;

  _RouteDetailState({required this.runningData});

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
                      if (!runningData.getIsRunning) {
                        runningData.toggleIsRunning();
                        runningData.setRoute("마포대교");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RunningApp(runningData: runningData),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("알림"),
                              content: Text("이미 러닝을 뛰고 있습니다."),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 알림 닫기
                                  },
                                  child: Text("확인"),
                                ),
                              ],
                            );
                          },
                        );
                      }
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