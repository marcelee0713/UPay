import 'package:citefest/constants/colors.dart';
import 'package:citefest/utils/index_provider.dart';
import 'package:citefest/widgets/landing/cards/card.dart';
import 'package:citefest/widgets/landing/landing_button.dart';
import 'package:citefest/widgets/landing/transactions/transaction_container.dart';
import 'package:citefest/widgets/universal/sub_section_info.dart';
import 'package:citefest/widgets/universal/user_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final myRegBox = Hive.box("sessions");
  late String? name = myRegBox.get("name");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          HeaderBar(
            subText: "welcome back",
            headText: name ?? "name",
            onPressProfile: () => changePage(index: 3, context: context),
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
                iconHeight: 20,
                iconWidth: 20,
                onTap: () {
                  Navigator.pushNamed(context, "/top_up_page");
                },
              ),
              const SizedBox(width: 10),
              LandingButton(
                buttonName: "Deposit",
                filePath: "assets/images/icons/deposit.png",
                onTap: () {
                  debugPrint("Tapped");
                  Navigator.pushNamed(context, "/transfer_to_page");
                },
                iconHeight: 20,
                iconWidth: 20,
              ),
              const SizedBox(width: 10),
              LandingButton(
                buttonName: "Withdraw",
                filePath: "assets/images/icons/withdrawal.png",
                onTap: () {},
                iconHeight: 20,
                iconWidth: 20,
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              TransactionContainer()
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
