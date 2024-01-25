import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/landing/card.dart';
import 'package:citefest/widgets/landing/landing_button.dart';
import 'package:citefest/widgets/landing/transactions/transaction_container.dart';
import 'package:citefest/widgets/universal/sub_section_info.dart';
import 'package:citefest/widgets/universal/user_status_bar.dart';
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
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          HeaderBar(
            subText: "welcome back",
            headText: "Grace Magicarp",
            onPressProfile: () {},
            onPressNotif: () {},
          ),
          const SizedBox(height: 20),
          const StudentCard(
              cardNumber: "** **** 032169", currentBalance: "P 152,236.34"),
          const SizedBox(height: 20),
          const SubSectionInfo(
            iconPath: "assets/images/icons/pie-chart.png",
            leftHeadText: "Insight",
            leftSubText: "Balance Trend",
            rightHeadText: "P 1000",
            rightSubText: "+4.3% vs last week",
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              LandingButton(
                buttonName: "Top Up",
                filePath: "assets/images/icons/top-up.png",
                onTap: () {},
              ),
              const SizedBox(width: 10),
              LandingButton(
                buttonName: "Transfer",
                filePath: "assets/images/icons/transfer.png",
                onTap: () {},
              ),
              const SizedBox(width: 10),
              LandingButton(
                buttonName: "Rewards",
                filePath: "assets/images/icons/coins.png",
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "view all",
                    style: TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const TransactionContainer()
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
