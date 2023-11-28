import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/views/widgets/route/routecard_small.dart';

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
      width: 30,
      height: 30,
      child:
      Card(
          child:
          Center(child: Text('||'))
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
                    Container(
                        height: 200,
                        child: Card(
                            child:
                            Container(
                                decoration:
                                BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFFF57073), Color(0xFFAA5454)],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: EdgeInsets.all(10),
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('🏃 마포대교',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                            )),
                                        stopButton(),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Center(
                                            child: const Text('01 : 04 : 57', style: TextStyle(fontWeight: FontWeight.bold))
                                        ),
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '7',
                                                  style: TextStyle(color: Colors.blue, fontFamily: 'SF Pro Text'),
                                                ),
                                                TextSpan(
                                                  text: '명이 함께 달리고 있어요!',
                                                  style: TextStyle(color: Colors.white, fontFamily: 'SF Pro Text'),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        indicatorCard('👟10.9', 'km'),
                                        indicatorCard('👣3432', '걸음수'),
                                      ],
                                    ),
                                  ],
                                )
                            )
                        )
                    ),
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
                          courseCard(context),
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