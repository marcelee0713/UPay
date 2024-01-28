import 'package:citefest/constants/colors.dart';
import 'package:citefest/pages/enter_mpin_page.dart';
import 'package:citefest/pages/log_in_page.dart';
import 'package:citefest/pages/create_mpin_page.dart';
import 'package:citefest/pages/receipt_page.dart';
import 'package:citefest/pages/registration_page.dart';
import 'package:citefest/pages/start_page.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ReceiptPage())),
              child: const Text("Receipt Page"),
            ),
          ],
        ),
      ),
    );
  }
}
