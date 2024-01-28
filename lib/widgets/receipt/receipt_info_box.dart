import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class ReceiptInfoBox extends StatelessWidget {
  final String leftHeaderText;
  final String rightHeaderText;
  final String leftSubText;
  final String rightSubText;
  const ReceiptInfoBox({
    super.key,
    required this.leftHeaderText,
    required this.rightHeaderText,
    required this.leftSubText,
    required this.rightSubText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftHeaderText,
              style: const TextStyle(
                color: ColorPalette.accentBlack,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Text(
              rightHeaderText,
              style: const TextStyle(
                color: ColorPalette.accentBlack,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 1.5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftSubText,
              style: const TextStyle(
                color: Color(0xff585858),
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
            Text(
              rightSubText,
              style: const TextStyle(
                color: Color(0xff585858),
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}
