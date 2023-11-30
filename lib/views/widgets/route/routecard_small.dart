import 'package:flutter/material.dart';
import 'package:joggigsir/runpage.dart';
import 'package:joggigsir/routedetail.dart';
import 'package:joggigsir/running_data.dart';

Widget courseCard(BuildContext context, RunningData runningData) {
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
                  Text('위치 이름'),
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
                          '경로 상세 정보',
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RunningApp(runningData: runningData),
                      ),
                    );
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