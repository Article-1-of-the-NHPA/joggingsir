import 'package:flutter/material.dart';
import './views/home/my_page_view.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(), // MainAppBar 위젯을 사용
    );
  }
}