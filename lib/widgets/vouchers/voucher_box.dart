import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class VoucherBox extends StatelessWidget {
  final String headText;
  final String desc;
  final String holder;
  final String imagePath;
  final VoidCallback onTap;
  const VoucherBox(
      {super.key,
      required this.headText,
      required this.desc,
      required this.holder,
      required this.imagePath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 170,
        width: 190,
        decoration: BoxDecoration(
          color: ColorPalette.accentWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 85,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  alignment: const Alignment(-1, -0.5),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headText,
                    style: const TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    desc,
                    style: const TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    holder,
                    style: const TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
