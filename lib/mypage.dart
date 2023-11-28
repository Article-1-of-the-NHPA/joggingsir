import 'package:flutter/material.dart';
import 'views/widgets/mypage/main_app_bar.dart';
import 'views/widgets/mypage/user_info.dart';
import 'views/widgets/mypage/recent_location.dart';
import 'views/widgets/mypage/running_record.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  final int _currentIndex = 2;
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainAppBar(title: 'MyPage'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserInfo(),
              RecentLocation(),
              RunningRecord(),
            ],
          ),
        ),
        bottomNavigationBar: MenuBottom(
          currentIndex: _currentIndex, // 현재 활성화된 탭의 인덱스 전달
        ),
      ),
    );
  }
}
