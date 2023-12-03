import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/views/widgets/route/routecard.dart';
import 'package:joggigsir/data_provider/running_data.dart';
import 'package:joggigsir/data_provider/course_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
            Container(
              height: 50,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Text(
                    '경로 추천',
                    style: TextStyle(fontFamily: "SF-Pro", fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              // height: 300,
              // padding: const EdgeInsets.only(top: 10),
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
                    return Expanded(child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return RouteCard(runningData: runningData,
                          courseData: snapshot.data![index],);
                      },
                      separatorBuilder: (BuildContext context,
                          int index) {
                        return SizedBox(height: 20);
                      },
                    )
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}