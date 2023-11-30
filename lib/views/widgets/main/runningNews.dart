import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _controller = PageController(initialPage: 0);
  final List<String> imagePaths = [
    'assets/running_news1.png',
    'assets/running_news2.png',
    'assets/running_news3.png',
  ];

  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), _updateSlider);
  }

  void _updateSlider(Timer timer) {
    if (_currentPage < imagePaths.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _controller.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: 350,// 원하는 높이로 설정
      child: PageView.builder(
        controller: _controller,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // 조절 가능한 반지름 값
              child: Image.asset(
                imagePaths[index],
                width: 350,
                height: 225,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}

