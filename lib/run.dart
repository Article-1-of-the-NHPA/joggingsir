import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Run(),
        ]),
      ),
    );
  }
}

class Run extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: const Color(0xFFFF6363)),
          child: Stack(
            children: [
              Positioned(
                left: 8,
                top: 810,
                child: Container(
                  width: 375,
                  height: 34,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 375,
                          height: 34,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 121,
                                top: 21,
                                child: Container(
                                  width: 134,
                                  height: 5,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF020202),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
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
              Positioned(
                left: 8,
                top: 0,
                child: Container(
                  width: 375,
                  height: 44,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 32,
                        top: 13,
                        child: Text(
                          '9:41',
                          style: TextStyle(
                            color: const Color(0xFF020202),
                            fontSize: 15,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            height: 0.09,
                            letterSpacing: -0.32,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 295,
                        top: 15,
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 16,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 1,
                                      top: 3,
                                      child: Container(
                                        width: 17,
                                        height: 10.67,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://via.placeholder.com/17x11"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 16,
                                height: 16,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0.35,
                                      top: 3,
                                      child: Container(
                                        width: 15.27,
                                        height: 10.97,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://via.placeholder.com/15x11"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 16,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(children: [
                                  // Add any intended content or remove this container
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 80,
                top: 80,
                child: Text(
                  '04:32',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.32,
                  ),
                ),
              ),
              Positioned(
                left: 136,
                top: 206,
                child: Container(
                  width: 119,
                  height: 210,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 22,
                        top: 0,
                        child: Container(
                          width: 73,
                          height: 54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 42,
                                child: Text(
                                  '5.2',
                                  style: TextStyle(
                                    color: const Color(0xFF2B2B2B),
                                    fontSize: 45,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
                                    height: 0.01,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 0,
                                child: Text(
                                  '거리(km)',
                                  style: TextStyle(
                                    color: const Color(0xFFEAEAEA),
                                    fontSize: 12,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w200,
                                    height: 0.15,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 78,
                        child: Container(
                          width: 119,
                          height: 54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 42,
                                child: Text(
                                  '3243',
                                  style: TextStyle(
                                    color: const Color(0xFF2B2B2B),
                                    fontSize: 45,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
                                    height: 0.01,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 42,
                                top: 0,
                                child: Text(
                                  '걸음수',
                                  style: TextStyle(
                                    color: const Color(0xFFEAEAEA),
                                    fontSize: 12,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w200,
                                    height: 0.15,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 156,
                        child: Container(
                          width: 83,
                          height: 54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 42,
                                child: Text(
                                  '120',
                                  style: TextStyle(
                                    color: const Color(0xFF877DFF),
                                    fontSize: 45,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
                                    height: 0.01,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 13,
                                top: 0,
                                child: Text(
                                  '적립 리워드',
                                  style: TextStyle(
                                    color: const Color(0xFFEAEAEA),
                                    fontSize: 12,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w200,
                                    height: 0.15,
                                    letterSpacing: -0.32,
                                  ),
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
              Positioned(
                left: 8,
                top: 34,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: Stack(
                          children: [
                            // Add any intended content or remove this container
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(children: [
                          // Add any intended content or remove this TextSpan
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 166,
                top: 519,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30.35,
                        top: 38,
                        child: SizedBox(
                          width: 10.59,
                          height: 28.24,
                          child: Text(
                            'I',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF2B2B2B),
                              fontSize: 24,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w700,
                              height: 0.03,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 38,
                        child: const SizedBox(
                          width: 10.59,
                          height: 28.24,
                          child: Text(
                            'I',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF2B2B2B),
                              fontSize: 24,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w700,
                              height: 0.03,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}