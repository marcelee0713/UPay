import 'package:citefest/constants/colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            InkWell(
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
                  widget.headText,
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
        InkWell(
          onTap: widget.onPressNotif,
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
