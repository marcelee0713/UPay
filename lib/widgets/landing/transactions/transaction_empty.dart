import 'package:flutter/material.dart';

class TransactionEmpty extends StatefulWidget {
  const TransactionEmpty({super.key});

  @override
  State<TransactionEmpty> createState() => _TransactionEmptyState();
}

class _TransactionEmptyState extends State<TransactionEmpty> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Empty!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "You don't have any transactions yet...",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
