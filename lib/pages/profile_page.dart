import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/profile/account_acitivity_box.dart';
import 'package:citefest/widgets/profile/profile_details_box.dart';
import 'package:citefest/widgets/universal/sub_section_info_closable.dart';
import 'package:citefest/widgets/universal/user_status_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            subText: "customize and verify",
            headText: "Your Profile",
            onPressProfile: () {},
            onPressNotif: () {},
          ),
          const SizedBox(height: 20),
          ClosableSubSectionInfo(
            icon: Icons.email_rounded,
            leftHeadText: "Your account is at risk",
            leftSubText:
                "verify your account and help us confirm your indentity",
            onClose: () {},
          ),
          const SizedBox(height: 20),
          const ProfileDetailsBox(
              name: "Grace Magicarp", balance: "P 699,350.00"),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Account",
                style: TextStyle(
                  color: ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  ActivityBox(
                    name: "Transactions",
                    filePath: "assets/images/icons/arrows.png",
                    onTap: () {},
                    iconSize: 29,
                  ),
                  const SizedBox(height: 15),
                  ActivityBox(
                    name: "Analytics and Insights",
                    filePath: "assets/images/icons/pie-chart.png",
                    onTap: () {},
                    iconSize: 25,
                  ),
                  const SizedBox(height: 15),
                  ActivityBox(
                    name: "Edit Profile",
                    filePath: "assets/images/icons/profile-edit.png",
                    onTap: () {},
                    iconSize: 32,
                  ),
                  const SizedBox(height: 15),
                  ActivityBox(
                    name: "Change MPIN",
                    filePath: "assets/images/icons/key.png",
                    onTap: () {},
                    iconSize: 23,
                  ),
                  const SizedBox(height: 15),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
