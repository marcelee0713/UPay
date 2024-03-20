import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class AmountPickerBox extends StatefulWidget {
  final int currentIndex;
  final int index;
  final String amount;
  final VoidCallback onTap;
  const AmountPickerBox({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.amount,
    required this.onTap,
  });

  @override
  State<AmountPickerBox> createState() => _AmountPickerBoxState();
}

class _AmountPickerBoxState extends State<AmountPickerBox> {
  @override
  Widget build(BuildContext context) {
    bool isPicked = widget.currentIndex == widget.index;
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isPicked ? ColorPalette.primary : Colors.transparent,
            border: Border.all(
              color: isPicked ? Colors.transparent : const Color(0xffCCCCCC),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "P ${widget.amount}",
                style: TextStyle(
                  color: isPicked
                      ? ColorPalette.accentWhite
                      : ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              // TODO: Make sure to track the transaction fee
              Text(
                "+P10 Transaction Fee",
                style: TextStyle(
                  color: isPicked
                      ? ColorPalette.accentWhite
                      : ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
