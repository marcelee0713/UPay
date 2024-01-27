import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatefulWidget {
  final String cardNumber;
  final String currentBalance;
  const StudentCard(
      {super.key, required this.cardNumber, required this.currentBalance});

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/icons/card1.png",
          ),
          fit: BoxFit.cover,
        ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "STUDENT CARD",
            style: TextStyle(
              color: ColorPalette.accentWhite,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            widget.cardNumber,
            style: const TextStyle(
              color: ColorPalette.accentWhite,
              fontFamily: "Nova Mono",
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 25),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset("assets/images/icons/upayoncard.png"),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Current Balance",
                  style: TextStyle(
                    color: ColorPalette.accentWhite,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Text(
                  widget.currentBalance,
                  style: const TextStyle(
                    color: ColorPalette.accentWhite,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
