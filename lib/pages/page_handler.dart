import 'package:citefest/constants/colors.dart';
import 'package:citefest/pages/analytics_page.dart';
import 'package:citefest/pages/landing_page.dart';
import 'package:citefest/pages/profile_page.dart';
import 'package:citefest/pages/vouchers_page.dart';
import 'package:citefest/utils/index_provider.dart';
import 'package:citefest/widgets/bottomnav/route_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    int pageIndex = Provider.of<PageIndexProvider>(context).pageIndex;

    return WillPopScope(
      onWillPop: () async {
        if (pageIndex == 0) SystemNavigator.pop();

        changePage(index: 0, context: context);

        return false;
      },
      child: Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: const <Widget>[
            LandingPage(),
            AnalyticsPage(),
            VoucherPage(),
            ProfilePage(),
          ],
        ),
        backgroundColor: ColorPalette.bgColor,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 72,
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
                      routeCallback: () =>
                          changePage(index: 0, context: context),
                      currentIndex: pageIndex,
                      routeIndex: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: RouteButton(
                        routeName: "Analytics",
                        filePath: "assets/images/icons/align.png",
                        routeCallback: () =>
                            changePage(index: 1, context: context),
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
                        routeCallback: () =>
                            changePage(index: 2, context: context),
                        currentIndex: pageIndex,
                        routeIndex: 2,
                      ),
                    ),
                    RouteButton(
                      routeName: "Profile",
                      filePath: "assets/images/icons/profile.png",
                      routeCallback: () =>
                          changePage(index: 3, context: context),
                      currentIndex: pageIndex,
                      routeIndex: 3,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorPalette.primary,
              child: Image.asset(
                "assets/images/icons/scan.png",
                height: 30,
                width: 30,
                color: ColorPalette.accentWhite,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
