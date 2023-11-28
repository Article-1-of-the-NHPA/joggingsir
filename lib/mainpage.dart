import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/views/widgets/route/routecard_small.dart';
import 'package:joggigsir/runningcard.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  final int _currentIndex = 0;
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                SizedBox(width: 8),
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MenuBottom(
            currentIndex: _currentIndex,
          ),
          body: _MainPage()
      ),
    );
  }
}

class _MainPage extends StatefulWidget {
  // const MainPage ({super.key});

  @override
  State<_MainPage> createState() => MainPageState();
}

Widget stopButton() {
  return Container(
      width: 40,
      height: 40,
      child:
      Card(
          child:
          Center(child: Icon(Icons.pause)),
      )
  );
}

Widget indicatorCard(String value, String unit) {
  return Container(
      width: 100,
      height: 30,
      child:
      Card(
          child:
          Center(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value),
                  Text(unit),
                ],
              )
          )
      )
  );
}

class MainPageState extends State<_MainPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Expanded(
            child: Center(
              child:
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('홍길동님 RUNNING PLACE'),
                        ],
                      ),
                    ),
                    RunningCard(),
                    Container(
                      margin: EdgeInsets.all(10),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('오늘의 경로 추천'),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          courseCard(context),
                          SizedBox(width: 8,),
                          courseCard(context),
                          SizedBox(width: 8,),
                          courseCard(context),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
}