import 'package:citefest/api/auth.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/notifications/notificaton_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  final String subText;
  final String headText;
  final VoidCallback onPressProfile;
  final VoidCallback onPressNotif;
  const HeaderBar(
      {super.key,
      required this.subText,
      required this.headText,
      required this.onPressProfile,
      required this.onPressNotif});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  User? user = getUser();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: widget.onPressProfile,
              child: Image.asset(
                "assets/images/icons/user.png",
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.subText,
                  style: const TextStyle(
                    color: ColorPalette.accentBlack,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2.5),
                Text(
                  widget.headText.length >= 15
                      ? "${widget.headText.substring(0, 14)}..."
                      : widget.headText,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ColorPalette.accentBlack,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () => NotifModal(uid: user!.uid).build(context),
          child: Image.asset(
            "assets/images/icons/bell.png",
            height: 30,
            width: 30,
            color: const Color(0xff585858),
          ),
        )
      ],
    );
  }
}
