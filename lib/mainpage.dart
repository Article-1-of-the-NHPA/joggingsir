import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
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
          appBar: AppBar(title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0),
              child: Container(
                color: Colors.black,
                height: 1.0,
              ),
            ),
          ),
          bottomNavigationBar: const MenuBottom(),
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

Widget courseCard() {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child:
    Column(
      children: [
        Container(
            width: 300,
            height: 200,
            child: Image.asset('assets/recordItem.png')
        ),
        SizedBox(height: 20),
        Container(
          width: 260,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('위치 이름'),
                  Text('경로 상세 정보'),
                ],
              ),
              Container(
                  width: 90,
                  height: 40,
                  child:
                  Card(
                    child: Center(child: Text('시작하기')),
                  )
              )
            ],
          ),
        ),
      ],
    ),
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
                          courseCard(),
                          courseCard(),
                          courseCard(),
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