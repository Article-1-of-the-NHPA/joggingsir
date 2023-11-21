import 'package:flutter/material.dart';

void main() {
  runApp(const RunningApp());
}

class RunningApp extends StatelessWidget {
  const RunningApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFF6464), // 배경색을 FF6464로 설정
      ),
      home: RunningScreen(),
    );
  }
}

class RunningScreen extends StatefulWidget {
  const RunningScreen({Key? key}) : super(key: key);

  @override
  _RunningScreenState createState() => _RunningScreenState();
}

class _RunningScreenState extends State<RunningScreen> {
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 버튼 동작
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // 간격 조정

              Text(
                '04:32',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.32,
                ),
              ),

              SizedBox(height: 20), // 간격 조정

              // 거리
              Text(
                '거리(km)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '5.2',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // 간격 조정

              // 걸음수
              Text(
                '걸음수',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '3242',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // 간격 조정

              // 적립 리워드
              Text(
                '적립 리워드',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '120',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 50), // 간격 조정

              // 일시정지/재생 버튼
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPaused = !isPaused;
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    isPaused ? Icons.play_arrow : Icons.pause,
                    color: const Color(0xFF2B2B2B),
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
