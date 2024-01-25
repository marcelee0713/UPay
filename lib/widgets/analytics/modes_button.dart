import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class AnalyticsButton extends StatefulWidget {
  final String section;
  final String currentSection;
  final String text;
  final VoidCallback onPressed;
  final double leftPos;
  final double rightPos;
  const AnalyticsButton(
      {super.key,
      required this.section,
      required this.currentSection,
      required this.onPressed,
      required this.text,
      required this.leftPos,
      required this.rightPos});

  @override
  State<AnalyticsButton> createState() => _AnalyticsButtonState();
}

class _AnalyticsButtonState extends State<AnalyticsButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.leftPos,
      right: widget.rightPos,
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: widget.currentSection == widget.section
                ? ColorPalette.primary
                : ColorPalette.gray,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              widget.currentSection == widget.section
                  ? BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.2,
                      blurRadius: 5,
                      offset: const Offset(
                        0,
                        0,
                      ),
                    )
                  : BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                    ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: ColorPalette.accentWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
