import 'package:flutter/material.dart';

class NavigateBar extends StatelessWidget {
  const NavigateBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home
            InkWell(
              onTap: () {
                // Home을 눌렀을 때의 동작
                // Do something
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.home),
                    SizedBox(height: 8),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Route
            InkWell(
              onTap: () {
                // Route를 눌렀을 때의 동작
                // Do something
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.run_circle),
                    SizedBox(height: 8),
                    Text(
                      'Route',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // MyPage
            InkWell(
              onTap: () {
                // MyPage를 눌렀을 때의 동작
                // Do something
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(height: 8),
                    Text(
                      'MyPage',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
