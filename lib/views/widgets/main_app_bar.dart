import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String title;

  const MainAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // 앱바 배경색을 흰색으로 설정
        title: Row(
          children: [
            SizedBox(width: 8), // 아이콘과 타이틀 사이의 간격 조절
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black, // 설정 버튼 아이콘의 색상을 검정색으로 설정
            ),
            onPressed: () {
              // 설정 버튼을 눌렀을 때 실행될 동작
              // 여기에 설정 버튼을 눌렀을 때의 동작을 추가할 수 있습니다.
            },
          ),
        ],
      ),
    );
  }
}
