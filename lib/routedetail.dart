import 'package:flutter/material.dart';
import 'package:joggigsir/MenuBottom.dart';

void main() {
  runApp(const RouteDetail());
}

class RouteDetail extends StatelessWidget {
  const RouteDetail({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Route Detail',
            style: TextStyle(fontFamily: "SF-Pro", color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          shape: const Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        bottomNavigationBar: const MenuBottom(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 600,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'images/maps.png',
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '경로 상세 정보',
                  style: TextStyle(fontFamily: "SF-Pro", fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(Icons.reviews),
                    SizedBox(width: 10),
                    Text(
                      '리뷰보여주기',
                      style: TextStyle(
                        fontFamily: "SF-Pro",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // 버튼 클릭 시 동작 추가
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(80, 30),
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 0.8,
                        ),
                      ),
                      primary: Colors.white,
                    ),
                    child: const Text(
                      '시작하기',
                      style: TextStyle(
                        fontFamily: "SF-Pro",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}