import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class MPINBUtton extends StatelessWidget {
  final String textName;
  final VoidCallback onTap;
  const MPINBUtton({super.key, required this.textName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Text(
          textName,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: ColorPalette.accentBlack,
          ),
        ),
      ),
    );
  }
}
