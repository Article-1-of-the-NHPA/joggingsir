import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/views/widgets/route/routecard.dart';
import 'package:joggigsir/data_provider/running_data.dart';

class RouteList extends StatefulWidget {
  final RunningData runningData;

  const RouteList({Key? key, required this.runningData}) : super(key: key);

  @override
  _RouteListState createState() => _RouteListState(runningData: runningData);
}

class _RouteListState extends State<RouteList> {
  final int _currentIndex = 1;
  final RunningData runningData;

  _RouteListState({required this.runningData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(width: 8),
              Text(
                "Route List",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: MenuBottom(
          currentIndex: _currentIndex, runningData: runningData// 현재 활성화된 탭의 인덱스 전달
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Text(
                    '경로 추천',
                    style: TextStyle(fontFamily: "SF-Pro", fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  RouteCard(runningData: runningData),
                  SizedBox(height: 20),
                  RouteCard(runningData: runningData),
                  SizedBox(height: 20),
                  RouteCard(runningData: runningData),
                  SizedBox(height: 20),
                  RouteCard(runningData: runningData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}