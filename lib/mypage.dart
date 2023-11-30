import 'package:flutter/material.dart';
import 'views/widgets/mypage/main_app_bar.dart';
import 'views/widgets/mypage/user_info.dart';
import 'views/widgets/mypage/recent_location.dart';
import 'views/widgets/mypage/running_record.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/running_data.dart';
import 'package:shake/shake.dart';

class MyPage extends StatefulWidget {
  final int _currentIndex = 2;
  final RunningData runningData;

  const MyPage({Key? key, required this.runningData}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState(runningData: runningData);
}

class _MyPageState extends State<MyPage> {
  final RunningData runningData;
  late ShakeDetector shaker;

  _MyPageState({required this.runningData});

  @override
  void initState() {
    super.initState();
    shaker = ShakeDetector.autoStart(
      shakeSlopTimeMS: 1000, // 흔들림 감지 간격
      shakeThresholdGravity: 1.5, // // 흔들림 강도
      onPhoneShake: () {
        setState(() {
          if (mounted && runningData.isRunning && !runningData.getIsPaused) {
            runningData.setSteps(runningData.getSteps + 1);
          }
        });
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 페이지가 활성화될 때 ShakeDetector 리스너를 시작
    shaker.startListening();
  }

  @override
  void dispose() {
    // 페이지가 비활성화될 때 ShakeDetector 리스너를 중지
    shaker.stopListening();
    super.dispose();
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
