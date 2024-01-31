import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
        gradient: const LinearGradient(
          colors: [
            Color(0xff6282E4),
            Color(0xff6F99E6),
            Color(0xff7DB2E9),
          ],
        ),
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
