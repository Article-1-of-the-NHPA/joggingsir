import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/user-info.dart';

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
        body: UserInfo()
      ),
    );
  }
}