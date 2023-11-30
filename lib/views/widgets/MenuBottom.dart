import 'package:flutter/material.dart';
import 'package:joggigsir/mainpage.dart';
import 'package:joggigsir/routelist.dart';
import 'package:joggigsir/mypage.dart';
import 'package:joggigsir/running_data.dart';

class MenuBottom extends StatelessWidget {
  final int currentIndex; // currentIndex 속성 추가
  final RunningData runningData;

  const MenuBottom({Key? key, required this.currentIndex, required this.runningData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        // index에 따라 각 아이템에 대한 동작을 수행
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(runningData: runningData),
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RouteList(runningData: runningData),
              ),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyPage(runningData: runningData),
              ),
            );
            break;
          default:
            break;
        }
      },
      selectedItemColor: Color(0xFFFF6464),
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.run_circle),
          label: 'Route',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'MyPage',
        ),
      ],
    );
  }
}