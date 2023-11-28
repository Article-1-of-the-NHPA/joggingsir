import 'package:flutter/material.dart';
import 'package:joggigsir/MenuBottom.dart';
import 'package:joggigsir/routedetail.dart';
import 'package:joggigsir/routecard.dart';

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
                children: const [
                  Text(
                    '경로 추천',
                    style: TextStyle(fontFamily: "SF-Pro", fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  RouteCard(),
                  SizedBox(height: 20),
                  RouteCard(),
                  SizedBox(height: 20),
                  RouteCard(),
                  SizedBox(height: 20),
                  RouteCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}