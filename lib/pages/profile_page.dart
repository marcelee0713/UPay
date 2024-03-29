import 'package:citefest/constants/colors.dart';
import 'package:citefest/utils/index_provider.dart';
import 'package:citefest/widgets/profile/account_acitivity_box.dart';
import 'package:citefest/widgets/profile/profile_details_box.dart';
import 'package:citefest/widgets/universal/dialog_info.dart';
import 'package:citefest/widgets/universal/dialog_loading.dart';
import 'package:citefest/widgets/universal/sub_section_info_closable.dart';
import 'package:citefest/widgets/universal/user_status_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          const ProfileDetailsBox(),
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
                    onTap: () => changePage(context: context, index: 0),
                    iconSizeHeight: 29,
                    iconSizeWidth: 25,
                  ),
                  const SizedBox(height: 15),
                  ActivityBox(
                    name: "Analytics and Insights",
                    filePath: "assets/images/icons/pie-chart.png",
                    onTap: () => changePage(context: context, index: 1),
                    iconSizeHeight: 25,
                    iconSizeWidth: 25,
                  ),
                  const SizedBox(height: 15),
                  ActivityBox(
                    name: "Edit Profile",
                    filePath: "assets/images/icons/edit-profile.png",
                    onTap: () {},
                    iconSizeHeight: 32,
                    iconSizeWidth: 25,
                  ),
                  const SizedBox(height: 15),
                  ActivityBox(
                    name: "Change MPIN",
                    filePath: "assets/images/icons/key.png",
                    onTap: () {},
                    iconSizeHeight: 23,
                    iconSizeWidth: 25,
                  ),
                  const SizedBox(height: 15),
                  ActivityBox(
                    name: "Sign-Out",
                    filePath: "assets/images/icons/exit.png",
                    onTap: () async {
                      DialogInfo(
                        headerText: "Quit UPay?",
                        subText: "Are you sure you want to quit?",
                        confirmText: "Confirm",
                        onCancel: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        onConfirm: () async {
                          Navigator.of(context, rootNavigator: true).pop();

                          DialogLoading(subtext: "Logging out...")
                              .build(context);

                          await FirebaseAuth.instance.signOut();

                          if (!mounted) return;

                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/start", (route) => false);
                        },
                      ).build(context);
                    },
                    iconSizeHeight: 25,
                    iconSizeWidth: 25,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
