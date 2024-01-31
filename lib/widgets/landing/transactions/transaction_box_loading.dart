import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TransactioBoxLoading extends StatelessWidget {
  const TransactioBoxLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.only(right: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: ColorPalette.accentWhite,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            decoration: const BoxDecoration(
              color: ColorPalette.skyBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
          ),
        ],
      ),
    ).animate(
      effects: [
        FadeEffect(
          begin: 0.8,
          curve: Curves.easeInOut,
          end: 1,
          duration: 900.milliseconds,
        ),
        const ThenEffect(),
        FadeEffect(
          begin: 1,
          curve: Curves.easeInOut,
          end: 0.8,
          duration: 900.milliseconds,
          delay: 900.milliseconds,
        ),
      ],
      onPlay: (controller) => controller.repeat(),
    );
  }
}
