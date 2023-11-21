import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double percent = 30.1;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rank',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the button press for "나의 순위 보기"
                          // Add your logic here
                        },
                        child: Text('나의 순위 보기'),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black,
              ),
              // First Box ("박스1")
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
                      style: TextStyle(
                        color: Color(0xFFFF7777),
                        fontSize: 10,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text.rich(
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
                    Text.rich(
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
                    Text.rich(
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
                      '2023년 10월 RANKING',
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
                        rows: [
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

        // Bottom Fixed Menu Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFFFFE4E1), // Light pink color for the menu bar
              borderRadius: BorderRadius.circular(12.0),
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
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
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
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
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
                // Match
                InkWell(
                  onTap: () {
                    // Match를 눌렀을 때의 동작
                    // Do something
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Match',
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
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
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
        ),


      ],
    );
  }
}
