import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TransactionBox extends StatelessWidget {
  final Duration animationDelay;
  final String recipient;
  final String type;
  final String amountType;
  final String amount;
  final int index;
  final VoidCallback onTap;
  final String date;
  final String? note;
  const TransactionBox(
      {super.key,
      required this.recipient,
      required this.type,
      required this.amountType,
      required this.amount,
      required this.index,
      required this.onTap,
      required this.date,
      this.note,
      required this.animationDelay});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
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
              const SizedBox(width: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipient,
                    style: const TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    type,
                    style: const TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    amountType == "increase" ? "+P $amount" : "-P $amount",
                    style: TextStyle(
                      color: amountType == "increase"
                          ? ColorPalette.primary
                          : ColorPalette.errorColor,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
            .animate(delay: animationDelay)
            .fadeIn(duration: 900.ms, delay: 300.ms)
            .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
            .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad));
  }
}
