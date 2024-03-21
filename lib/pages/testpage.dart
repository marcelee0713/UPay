import 'package:citefest/constants/colors.dart';
import 'package:citefest/models/transactions.dart';
import 'package:citefest/pages/auth/enter_mpin_page.dart';
import 'package:citefest/pages/auth/log_in_page.dart';
import 'package:citefest/pages/auth/create_mpin_page.dart';
import 'package:citefest/pages/receipt_page.dart';
import 'package:citefest/pages/auth/registration_page.dart';
import 'package:citefest/pages/auth/start_page.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  final String? test;
  const TestPage({super.key, this.test});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StartPage())),
              child: const Text("Start Page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage())),
              child: const Text("Registration Page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnterMPINPage())),
              child: const Text("Enter MPIN Page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInPage())),
              child: const Text("Sign In Page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateMPINPage())),
              child: const Text("Create MPIN Page"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReceiptPage(
                    data: TransactionModel(
                        type: "Top Up",
                        desc:
                            "You've successfully sent money to 03-2122-034361",
                        amount: "15000",
                        senderLeftHeadText: "From",
                        senderLeftSubText: "E-Wallet",
                        senderRightHeadText: "Marcel Paolo Magbual",
                        senderRightSubText: "UPay",
                        recipientLeftHeadText: "To",
                        recipientLeftSubText: "E-Wallet",
                        recipientRightHeadText: "Juan Turtle",
                        recipientRightSubText: "UPay",
                        time: "10:34 am",
                        pointsEarned: "12.00",
                        uid: '',
                        createdAt: '',
                        amountType: '',
                        recipient: ''),
                    onExit: () => {},
                  ),
                ),
              ),
              child: const Text("Receipt Page"),
            ),
          ],
        ),
      ),
    );
  }
}
