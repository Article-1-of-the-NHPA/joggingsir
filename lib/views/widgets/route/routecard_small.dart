import 'package:flutter/material.dart';
import 'package:joggigsir/runpage.dart';

Widget courseCard(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child:
    Column(
      children: [
        Container(
            width: 300,
            height: 200,
            child: Image.asset('assets/recordItem.png')
        ),
        SizedBox(height: 20),
        Container(
          width: 260,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('위치 이름'),
                  Text('경로 상세 정보'),
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
                        builder: (context) => RunningApp(),
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