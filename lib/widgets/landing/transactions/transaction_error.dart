import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class TransactionError extends StatelessWidget {
  final String? error;

  const TransactionError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Error",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorPalette.errorColor,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          error ?? "Something went wrong! Contact the Devs immediately!",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorPalette.accentBlack,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
