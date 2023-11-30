import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/views/widgets/route/routecard_small.dart';
import 'package:joggigsir/views/widgets/runningcard.dart';
import 'package:joggigsir/data_provider/running_data.dart';
import 'package:joggigsir/views/widgets/main/runningNews.dart';

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
  State<_MainPage> createState() => MainPageState(runningData: runningData);
}

class MainPageState extends State<_MainPage> {
  final RunningData runningData;

  MainPageState({required this.runningData});

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
                        Text(runningData.getIsRunning
                            ? '홍길동님 RUNNING PLACE'
                            : 'Running News'),
                      ],
                    ),
                  ),
                  runningData.getIsRunning
                      ? RunningCard(runningData: runningData)
                      : ImageSlider(), // ImageSlider 위젯을 사용합니다.
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
                        courseCard(context, runningData),
                        SizedBox(width: 8,),
                        courseCard(context, runningData),
                        SizedBox(width: 8,),
                        courseCard(context, runningData),
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

