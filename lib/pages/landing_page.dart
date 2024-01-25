// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.0, left: 18.0, right: 18.0),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  // for user icon
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/icons/user.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'welcome back,',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        'Ranier Tan',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  // for bell icon
                },
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/icons/bell.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                width: 391,
                height: 179,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/icons/card1.png'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 15,
                left: 20,
                child: Text(
                  'STUDENT CARD',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                top: 48,
                left: 20,
                child: Text(
                  '** **** 032169',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nova Mono',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                top: 127,
                left: 20,
                child: Text(
                  'Current Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Positioned(
                top: 137,
                left: 20,
                child: Row(
                  children: [
                    Text(
                      'P 699, 350.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                width: 420,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(35, 60, 138, 1),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ], // Rounded corners
                ),
              ),
              Positioned(
                top: 10,
                left: 25,
                child: Row(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        const Color(0xFF6282E4),
                        BlendMode.srcIn,
                      ),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/images/icons/pie-chart.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              Positioned(
                top: 13,
                left: 80,
                child: Text(
                  'Insight',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 23,
                left: 80,
                child: Row(
                  children: [
                    Text(
                      'Balance Trend',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 20,
                child: Text(
                  'P 789, 999.05',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 26,
                right: 40,
                child: Text(
                  '+4.3% vs last week',
                  style: TextStyle(
                    color: Color(0xFF2EDCA1),
                    fontFamily: 'Montserrat',
                    fontSize: 8,
                    fontWeight: FontWeight.w300,
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
