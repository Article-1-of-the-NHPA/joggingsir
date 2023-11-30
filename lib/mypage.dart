import 'package:flutter/material.dart';
import 'views/widgets/mypage/main_app_bar.dart';
import 'views/widgets/mypage/user_info.dart';
import 'views/widgets/mypage/recent_location.dart';
import 'views/widgets/mypage/running_record.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/running_data.dart';

class MyPage extends StatefulWidget {
  final int _currentIndex = 2;
  final RunningData runningData;

  const MyPage({Key? key, required this.runningData}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState(runningData: runningData);
}

class _MyPageState extends State<MyPage> {
  final RunningData runningData;

  _MyPageState({required this.runningData});

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainAppBar(title: 'MyPage'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserInfo(runningData: widget.runningData),
              RecentLocation(),
              RunningRecord(),
            ],
          ),
        ),
        bottomNavigationBar: MenuBottom(
          currentIndex: widget._currentIndex,
          runningData: widget.runningData,
        ),
      ),
    );
  }
}
