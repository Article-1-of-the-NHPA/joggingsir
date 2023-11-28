import 'package:flutter/material.dart';
import 'views/widgets/main_app_bar.dart';
import 'views/widgets/user_info.dart';
import 'views/widgets/recent_location.dart';
import 'views/widgets/running_record.dart';
import 'views/widgets/navigate_bar.dart';
import 'package:joggigsir/MenuBottom.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainAppBar(title: 'MyPage'),
        body: Column(
          children: [
            UserInfo(),
            RecentLocation(),
            RunningRecord(),
          ],
        ),
        bottomNavigationBar: const MenuBottom(),
      ),
    );
  }
}
