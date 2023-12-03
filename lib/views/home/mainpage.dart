import 'package:flutter/material.dart';
import 'package:joggigsir/data_provider/course_data.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/views/widgets/route/routecard_small.dart';
import 'package:joggigsir/views/widgets/main/runningcard.dart';
import 'package:joggigsir/data_provider/running_data.dart';
import 'package:joggigsir/views/widgets/main/runningNews.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  // final List<CourseData> courseList = [CourseData("갑천 코스 A", "유림공원", ""), CourseData("갑천 코스 B", "봉명->가수원", ""), CourseData("갑천 코스 C", "충남대->반석", "")];

  MainPageState({required this.runningData});

  Future<List<CourseData>> getCourseList() async {
    List<CourseData> courseList = [];
    final url = Uri.parse('http://10.0.2.2:8000/courses');
    final response = await http.get(url);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    for(int i=0; i<json.length; i++) {
      var data = json[i];
      courseList.add(CourseData(data[1], data[3], ""));
    }

    return courseList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(runningData.getIsRunning
                            ? '남용우님 RUNNING PLACE'
                            : 'Running News'),
                      ],
                    ),
                  ),
                  runningData.getIsRunning
                      ? RunningCard(runningData: runningData)
                      : ImageSlider(), // ImageSlider 위젯을 사용합니다.
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('오늘의 경로 추천'),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: FutureBuilder(
                      // Future to resolve
                      future: getCourseList(),
                      // Builder with context, AsyncSnapshot
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
                          }
                          //error가 발생하게 될 경우 반환하게 되는 부분
                          else if (snapshot.hasError) {
                            return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                              style: TextStyle(fontSize: 15),
                              ),
                            );
                          }
                          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
                          else {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return courseCard(context, runningData,
                                    snapshot.data![index]);
                              },
                              separatorBuilder: (BuildContext context,
                                  int index) {
                                return const SizedBox(width: 8,);
                              },
                            );
                          }
                      },
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

