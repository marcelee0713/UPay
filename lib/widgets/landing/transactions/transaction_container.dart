import 'package:citefest/api/auth.dart';
import 'package:citefest/api/transactions.dart';
import 'package:citefest/models/transactions.dart';
import 'package:citefest/pages/receipt_page.dart';
import 'package:citefest/widgets/landing/transactions/transaction.box.dart';
import 'package:citefest/widgets/landing/transactions/transaction_box_loading.dart';
import 'package:citefest/widgets/landing/transactions/transaction_empty.dart';
import 'package:citefest/widgets/landing/transactions/transaction_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = getUser();

    return SizedBox(
      height: 175,
      child: FutureBuilder<TransactionsRes?>(
          future: apiGetTransactions(uid: user!.uid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TransactioBoxLoading();
                },
              );
            }

            if (snapshot.hasError) {
              return TransactionError(error: snapshot.data!.errorMessage);
            }

            List<TransactionModel> list = snapshot.data!.list;
            int incrDelay = 700;

            if (list.isEmpty) {
              return const TransactionEmpty();
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                incrDelay += 100;
                return TransactionBox(
                  type: list[index].type,
                  amountType: list[index].amountType,
                  amount: list[index].amount,
                  index: index,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptPage(
                            data: list[index],
                            onExit: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    );
                  },
                  date: list[index].createdAt,
                  recipient: list[index].recipient,
                  note: list[index].note ?? "",
                  animationDelay: Duration(milliseconds: incrDelay),
                );
              },
            );
          }),
    );
  }
}
