import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/views/widgets/route/routecard_small.dart';
import 'package:joggigsir/views/widgets/runningcard.dart';
import 'package:joggigsir/running_data.dart';

class MainPage extends StatelessWidget {
  final int _currentIndex = 0;
  final RunningData runningData; // 수정: RunningData 인자

  const MainPage({Key? key, required this.runningData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(width: 8),
              Text(
                "Home",
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
          currentIndex: _currentIndex, runningData: runningData
        ),
        body: _MainPage(runningData: runningData), // 수정: RunningData 객체 전달
      ),
    );
  }
}

class _MainPage extends StatefulWidget {
  final RunningData runningData;

  const _MainPage({Key? key, required this.runningData}) : super(key: key);

  @override
  State<_MainPage> createState() => MainPageState(runningData: runningData); // 수정: RunningData 객체 전달
}

class MainPageState extends State<_MainPage> {
  final RunningData runningData;

  MainPageState({required this.runningData}); // 수정: RunningData 객체 전달

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('홍길동님 RUNNING PLACE'),
                      ],
                    ),
                  ),
                  RunningCard(runningData: runningData), // 수정: RunningData 객체 전달
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('오늘의 경로 추천'),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        courseCard(context, runningData), // 수정: RunningData 객체 전달
                        SizedBox(width: 8,),
                        courseCard(context, runningData), // 수정: RunningData 객체 전달
                        SizedBox(width: 8,),
                        courseCard(context, runningData), // 수정: RunningData 객체 전달
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
