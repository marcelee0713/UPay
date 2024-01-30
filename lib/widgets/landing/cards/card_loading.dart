import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorPalette.skyBlue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(
              0,
              4,
            ),
          )
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
