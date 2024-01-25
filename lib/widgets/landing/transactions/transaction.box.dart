import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class TransactionBox extends StatelessWidget {
  final String companyName;
  final String type;
  final String amountType;
  final String amount;
  final int index;
  final VoidCallback onTap;
  const TransactionBox(
      {super.key,
      required this.companyName,
      required this.type,
      required this.amountType,
      required this.amount,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                4,
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
                  companyName,
                  style: const TextStyle(
                    color: ColorPalette.accentBlack,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w800,
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
                  amountType == "increased" ? "+$amount" : "-$amount",
                  style: TextStyle(
                    color: amountType == "increased"
                        ? ColorPalette.primary
                        : ColorPalette.errorColor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
