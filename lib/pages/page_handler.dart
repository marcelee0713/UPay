import 'package:citefest/constants/colors.dart';
import 'package:citefest/pages/analytics_page.dart';
import 'package:citefest/pages/landing_page.dart';
import 'package:citefest/pages/profile_page.dart';
import 'package:citefest/pages/vouchers_page.dart';
import 'package:citefest/widgets/bottomnav/route_button.dart';
import 'package:flutter/material.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({super.key});

  @override
  State<PageHandler> createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
  final pages = [
    const LandingPage(),
    const AnalyticsPage(),
    const VoucherPage(),
    const ProfilePage(),
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      backgroundColor: ColorPalette.bgColor,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          decoration: const BoxDecoration(
            color: ColorPalette.accentWhite,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RouteButton(
                    routeName: "Dashboard",
                    filePath: "assets/images/icons/home.png",
                    routeCallback: () => {
                      setState(() {
                        pageIndex = 0;
                      })
                    },
                    currentIndex: pageIndex,
                    routeIndex: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RouteButton(
                      routeName: "Analytics",
                      filePath: "assets/images/icons/align.png",
                      routeCallback: () => {
                        setState(() {
                          pageIndex = 1;
                        })
                      },
                      currentIndex: pageIndex,
                      routeIndex: 1,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: RouteButton(
                      routeName: "Vouchers",
                      filePath: "assets/images/icons/tag.png",
                      routeCallback: () => {
                        setState(() {
                          pageIndex = 2;
                        })
                      },
                      currentIndex: pageIndex,
                      routeIndex: 2,
                    ),
                  ),
                  RouteButton(
                    routeName: "Profile",
                    filePath: "assets/images/icons/profile.png",
                    routeCallback: () => {
                      setState(() {
                        pageIndex = 3;
                      })
                    },
                    currentIndex: pageIndex,
                    routeIndex: 3,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorPalette.primary,
        child: Image.asset(
          "assets/images/icons/scan.png",
          height: 30,
          width: 30,
          color: ColorPalette.accentWhite,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
