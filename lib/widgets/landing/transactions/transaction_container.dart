import 'package:citefest/widgets/landing/transactions/transaction.box.dart';
import 'package:flutter/material.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: getList().length,
        itemBuilder: (context, index) {
          return TransactionBox(
            companyName: getList()[index].companyName,
            type: getList()[index].type,
            amountType: getList()[index].amountType,
            amount: getList()[index].amount,
            index: index,
            onTap: () {},
          );
        },
      ),
    );
  }

  List<Transactions> getList() {
    List<Transactions> list = [
      Transactions("Gcash Inc.", "Top up", "P 10,000.00", "increased"),
      Transactions("PHINMA-Upang", "P1 payment", "P 4,245.00", "decreased"),
      Transactions("Kusina ni Karding", "Hotdog", "P 45.00", "decreased"),
      Transactions("Gcash Inc.", "Top up", "P 1,000.00", "increased"),
      Transactions("BJ Muoko", "Buko Juice", "P 30.00", "decreased"),
      Transactions(
          "PHINMA-Upang", "Fun Run Ticket 2023-2024", "P 500.00", "decreased")
    ];

    return list;
  }
}

class Transactions {
  final String companyName;
  final String type;
  final String amount;
  final String amountType;

  Transactions(this.companyName, this.type, this.amount, this.amountType);
}
