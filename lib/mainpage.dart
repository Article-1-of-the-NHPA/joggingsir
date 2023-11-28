import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: Colors.black,
              height: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '홍길동',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Color(0xFFFA4545),
                    fontSize: 24.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '님 RUNNING PLACE',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFA4545),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '마포대교',
                          style: TextStyle(color: Colors.white, fontFamily: 'SF Pro Text'),
                        ),
                        IconButton(
                          onPressed: () {
                            // 일시정지 버튼
                          },
                          icon: Icon(Icons.pause),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      '01:04:57',
                      style: TextStyle(color: Colors.black, fontFamily: 'SF Pro Text', fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '7',
                            style: TextStyle(color: Colors.blue, fontFamily: 'SF Pro Text'),
                          ),
                          TextSpan(
                            text: '명이 함께 달리고 있어요!',
                            style: TextStyle(color: Colors.white, fontFamily: 'SF Pro Text'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Text('10.9 km', style: TextStyle(fontFamily: 'SF Pro Text')),
                        ),
                        SizedBox(width: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Text('3432 걸음수', style: TextStyle(fontFamily: 'SF Pro Text')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '오늘의 경로 추천',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '더보기',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.grey, // 더보기 텍스트 색상 변경
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(height: 8.0),
                    Text('위치 이름', style: TextStyle(fontFamily: 'SF Pro Text')),
                    SizedBox(height: 8.0),
                    Text('경로 상세 정보', style: TextStyle(fontFamily: 'SF Pro Text')),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // 시작하기 버튼 누를 때의 동작 구현
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text('시작하기', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE4E1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        // Home을 눌렀을 때의 동작
                        // Do something
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.home),
                            SizedBox(height: 8),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Route를 눌렀을 때의 동작
                        // Do something
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.run_circle),
                            SizedBox(height: 8),
                            Text(
                              'Route',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // MyPage를 눌렀을 때의 동작
                        // Do something
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.account_circle),
                            SizedBox(height: 8),
                            Text(
                              'MyPage',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
