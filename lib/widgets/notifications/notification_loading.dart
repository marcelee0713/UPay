import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NotificationLoading extends StatelessWidget {
  const NotificationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 175, 191, 240),
                width: 1,
              ),
            ),
          ),
        ).animate(
          effects: [
            FadeEffect(
              begin: 0.2,
              curve: Curves.easeInOut,
              end: 1,
              duration: 900.milliseconds,
            ),
            const ThenEffect(),
            FadeEffect(
              begin: 1,
              curve: Curves.easeInOut,
              end: 0.2,
              duration: 900.milliseconds,
              delay: 900.milliseconds,
            ),
          ],
          onPlay: (controller) => controller.repeat(),
        );
      },
    );
  }
}
