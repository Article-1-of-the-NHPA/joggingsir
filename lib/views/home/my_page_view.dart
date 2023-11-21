import '../widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyPage());
}
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainAppBar(title: 'MyPage'), // MainAppBar 위젯을 사용
    );
  }
}