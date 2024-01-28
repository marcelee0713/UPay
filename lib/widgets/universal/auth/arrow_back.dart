import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  final VoidCallback onTap;
  const ArrowBack({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Color(0xff585858),
          size: 30,
        ),
      ),
    );
  }
}
