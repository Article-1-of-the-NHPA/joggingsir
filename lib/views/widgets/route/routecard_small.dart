import 'package:flutter/material.dart';
import 'package:joggigsir/views/home/runpage.dart';
import 'package:joggigsir/views/home/routedetail.dart';
import 'package:joggigsir/data_provider/running_data.dart';
import 'package:joggigsir/data_provider/course_data.dart';

Widget courseCard(BuildContext context, RunningData runningData, CourseData courseData) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    padding: const EdgeInsets.all(0.0),
    constraints: const BoxConstraints(maxWidth: 400),
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
      children: [
        Container(
            width: 300,
            height: 200,
            child: Image.asset('assets/recordItem.png')
        ),
        SizedBox(height: 8),
        Container(
          width: 260,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(courseData.name),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RouteDetail(runningData: runningData),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10), // Set width and height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Set border-radius to 30
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          courseData.info,
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (!runningData.getIsRunning) {
                      runningData.toggleIsRunning();
                      runningData.setRoute(courseData.name);
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
                    primary: Color(0xFFFF6464), // 버튼의 배경색
                  ),
                  child: Text(
                    '시작하기',
                    style: TextStyle(
                      color: Colors.white, // 텍스트의 색
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}