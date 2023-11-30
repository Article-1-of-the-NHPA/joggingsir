import 'package:flutter/material.dart';
import 'package:joggigsir/views/widgets/MenuBottom.dart';
import 'package:joggigsir/mypage.dart';
import 'package:joggigsir/running_data.dart';
import 'package:shake/shake.dart';

class RankingPage extends StatefulWidget {
  final RunningData runningData;
  final int _currentIndex = 2;

  const RankingPage({Key? key, required this.runningData})
      : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState(runningData: runningData);
}

class _RankingPageState extends State<RankingPage> {
  final RunningData runningData;

  _RankingPageState ({required this.runningData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(width: 8),
              Text(
                "Rank",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPage(runningData: widget.runningData),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: RankingScreen(runningData: runningData),
        bottomNavigationBar: MenuBottom(
          currentIndex: widget._currentIndex, runningData: widget.runningData,
        ),
      ),
    );
  }
}

class RankingScreen extends StatefulWidget {
  final RunningData runningData;

  RankingScreen({Key? key, required this.runningData}) : super(key: key);

  @override
  _RankingScreenState createState() => _RankingScreenState(runningData: runningData);
}

class _RankingScreenState extends State<RankingScreen> {
  final RunningData runningData;
  late ShakeDetector shaker;

  _RankingScreenState({required this.runningData});

  @override
  void initState() {
    super.initState();
    shaker = ShakeDetector.autoStart(
      shakeSlopTimeMS: 1000, // 흔들림 감지 간격
      shakeThresholdGravity: 1.5, // // 흔들림 강도
      onPhoneShake: () {
        setState(() {
          if (mounted && runningData.isRunning && !runningData.getIsPaused) {
            runningData.setSteps(runningData.getSteps + 1);
          }
        });
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 페이지가 활성화될 때 ShakeDetector 리스너를 시작
    shaker.startListening();
  }

  @override
  void dispose() {
    // 페이지가 비활성화될 때 ShakeDetector 리스너를 중지
    shaker.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percent = 30.1;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8,),
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFAFAF), Colors.white],
                  ),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left-align this line
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '홍길동',
                              style: TextStyle(
                                color: Color(0xFFFF7777),
                                fontSize: 23,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w700,
                                height: 0.00,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF93D8D8),
                                fontSize: 25,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w700,
                                height: 0.03,
                              ),
                            ),
                            TextSpan(
                              text: '님의 이번 달 등급은',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w700,
                                height: 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Center-align the rest of the content
                    SizedBox(height: 8.0),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/profile_picture.jpg'),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Red',
                      style: TextStyle(
                        color: Color(0xFFFF7777),
                        fontSize: 25,
                        fontFamily: 'Pattaya',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '(상위 ${percent.toStringAsFixed(1)}%, 40등)',
                      style: const TextStyle(
                        color: Color(0xFFFF7777),
                        fontSize: 10,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '이번 달에 총 ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '208 ',
                            style: TextStyle(
                              color: Color(0xFFFF7777),
                              fontSize: 13,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '걸음 달렸어요!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '이번 달에 총 ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '18',
                            style: TextStyle(
                              color: Color(0xFFFF7777),
                              fontSize: 13,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'km 달렸어요!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Removed the percentage bar
                  ],
                ),
              ),

              // Second Box
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '다음 달 예상 ',
                            style: TextStyle(
                              color: Color(0xFF919191),
                              fontSize: 12,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Red',
                            style: TextStyle(
                              color: Color(0xFF919191),
                              fontSize: 12,
                              fontFamily: 'Pattaya',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text:
                            '                                                                                                   ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Pattaya',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '  Gold',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 12,
                              fontFamily: 'Pattaya',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '10,000',
                            style: TextStyle(
                              color: Color(0xFFFF7777),
                              fontSize: 13,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '걸음 / ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '10',
                            style: TextStyle(
                              color: Color(0xFFFF7777),
                              fontSize: 12,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' km 더 달리면 ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Gold',
                            style: TextStyle(
                              color: Color(0xFFE7DB6E),
                              fontSize: 12,
                              fontFamily: 'Pattaya',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' 가 될 수 있어요! ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    LinearProgressIndicator(
                      value: percent / 100,
                      backgroundColor: Colors.grey,
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ],
                ),
              ),
              // Third Box
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Text(
                      '👑2023년 10월 RANKING👑',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Noto Sans KR',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 10.0,
                        dataRowHeight: 40.0,
                        columns: [
                          DataColumn(
                            label: Container(
                              width: 30.0,
                              child: Center(child: Text('Rank')),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 80.0,
                              child: Center(child: Text('이름')),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 80.0,
                              child: Center(child: Text('걸음')),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 80.0,
                              child: Center(child: Text('거리')),
                            ),
                          ),
                        ],
                        rows: const [
                          DataRow(cells: [
                            DataCell(Text('  1')),
                            DataCell(Text('      김여린')),
                            DataCell(Text('303,900걸음')),
                            DataCell(Text('      66km')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('  2')),
                            DataCell(Text('      박여진')),
                            DataCell(Text('303,030걸음')),
                            DataCell(Text('      62km')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('  3')),
                            DataCell(Text('      장주형')),
                            DataCell(Text('300,000걸음')),
                            DataCell(Text('      60km')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('  4')),
                            DataCell(Text('      홍가람')),
                            DataCell(Text('208,971걸음')),
                            DataCell(Text('      50km')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('  5')),
                            DataCell(Text('      가나다')),
                            DataCell(Text('2324걸음')),
                            DataCell(Text('      24km')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}