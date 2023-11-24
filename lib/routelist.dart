import 'package:flutter/material.dart';
import 'package:untitled1/MenuBottom.dart';
import 'package:untitled1/routedetail.dart';

void main() {
  runApp(const RouteList());
}

class RouteList extends StatelessWidget {
  const RouteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: const Text(
            'Route List',
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //const Divider(thickness: 1.5, color: Colors.black),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text(
                    '경로 추천',
                    style: TextStyle(fontFamily: "SF-Pro", fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    constraints: const BoxConstraints(maxWidth: 400),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/maps_small.png',
                            height: 150,
                            width: 800,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '제목',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '경로 상세 정보',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.gps_fixed,
                              size: 10.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '장대동 학사마을 다리 밑',
                              style: TextStyle(
                                fontFamily: "SF-Pro",
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    constraints: const BoxConstraints(maxWidth: 400),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/maps_small.png',
                            height: 150,
                            width: 800,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '제목',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '경로 상세 정보',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.gps_fixed,
                              size: 10.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '장대동 학사마을 다리 밑',
                              style: TextStyle(
                                fontFamily: "SF-Pro",
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    constraints: const BoxConstraints(maxWidth: 400),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/maps_small.png',
                            height: 150,
                            width: 800,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '제목',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '경로 상세 정보',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.gps_fixed,
                              size: 10.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '장대동 학사마을 다리 밑',
                              style: TextStyle(
                                fontFamily: "SF-Pro",
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    constraints: const BoxConstraints(maxWidth: 400),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/maps_small.png',
                            height: 150,
                            width: 800,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '제목',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '경로 상세 정보',
                          style: TextStyle(
                            fontFamily: "SF-Pro",
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.gps_fixed,
                              size: 10.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '장대동 학사마을 다리 밑',
                              style: TextStyle(
                                fontFamily: "SF-Pro",
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
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
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
