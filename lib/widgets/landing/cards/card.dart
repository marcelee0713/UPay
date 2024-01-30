import 'package:citefest/api/auth.dart';
import 'package:citefest/api/user.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/models/student_card.dart';
import 'package:citefest/utils/money_formatter.dart';
import 'package:citefest/widgets/landing/cards/card_error.dart';
import 'package:citefest/widgets/landing/cards/card_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StudentCard extends StatefulWidget {
  final String cardNumber;
  final String currentBalance;
  const StudentCard(
      {super.key, required this.cardNumber, required this.currentBalance});

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  User? user = getUser();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StudentCardRes>(
        future: apiStudentCard(uid: user!.uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingCard();
          }

          if (snapshot.hasError) {
            return ErrorCard(
                error: snapshot.data?.errorMessage ??
                    "Something just went wrong!, report it to the devs immediately!");
          }

          StudentCardModel? data = snapshot.data!.studentCardRes;

          double balance = double.parse(data!.balance);
          String formattedMoney = formatMoney(balance);

          String hiddenStudentNumber =
              "** **** ${data.studentNumber.split("-")[2]}";

          return GestureDetector(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Container(
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
                    isVisible ? data.studentNumber : hiddenStudentNumber,
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
                          formattedMoney,
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
            ),
          ).animate().fadeIn(duration: 900.milliseconds);
        });
  }
}
