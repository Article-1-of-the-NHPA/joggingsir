import 'package:flutter/material.dart';
import 'package:joggigsir/runpage.dart';
import 'package:joggigsir/routedetail.dart';

class RouteCard extends StatelessWidget {
  const RouteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'assets/maps_small.png',
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
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteDetail(),
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10), // Set width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Set border-radius to 30
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '경로 상세 정보',
                  style: TextStyle(
                    fontFamily: "SF-Pro",
                    fontSize: 18,
                  ),
                ),
              ],
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RunningApp(),
                    ),
                  );
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
    );
  }
}
