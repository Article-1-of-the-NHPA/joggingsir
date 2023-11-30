import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joggigsir/views/home/ranking_page.dart';
import 'package:joggigsir/running_data.dart';

class UserInfo extends StatelessWidget {
  final RunningData runningData;

  const UserInfo({Key? key, required this.runningData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: SizedBox(
          height: 260,
          width: 357,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.black),
            ),
            elevation: 4.0,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              image: AssetImage('assets/profile_picture.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all( Radius.circular(50.0)),
                            border: Border.all(
                              color: const Color(0xffff7777),
                              width: 4.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'User',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.edit, // Use Icons.edit for a pencil icon
                                    size: 18,
                                  ),
                                  SizedBox(width: 6),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RankingPage(runningData: runningData),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF6060).withOpacity(0.3), // Set background color to FF6060
                                      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10), // Set width and height
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0), // Set border-radius to 30
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Red',
                                          style: GoogleFonts.getFont(
                                            'Pattaya',
                                            textStyle: const TextStyle(color: Color(0xffff6060), fontSize: 13),
                                          ),
                                        ),
                                        Icon(
                                            Icons.arrow_forward_ios,
                                            size: 18,
                                            color: Color(0xffff6060)
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'admin@naver.com',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '리워드',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '120',
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios, // You can replace this with your '>' icon
                                        size: 18,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '찜한 경로',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '5',
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios, // You can replace this with your '>' icon
                                        size: 18,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '최근 방문 경로',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.5)),
                        ),
                        Text(
                          '리뷰 관리',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 50 / 2,
                          backgroundImage: NetworkImage('https://mblogthumb-phinf.pstatic.net/MjAyMjAyMDdfMjEy/MDAxNjQ0MTk0Mzk2MzY3.WAeeVCu2V3vqEz_98aWMOjK2RUKI_yHYbuZxrokf-0Ug.sV3LNWlROCJTkeS14PMu2UBl5zTkwK70aKX8B1w2oKQg.JPEG.41minit/1643900851960.jpg?type=w800'),
                        ),
                        Text('|', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100)),
                        Text(
                          '3',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}