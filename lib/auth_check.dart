import 'package:citefest/api/auth.dart';
import 'package:citefest/pages/auth/enter_mpin_page.dart';
import 'package:citefest/pages/auth/start_page.dart';
import 'package:citefest/pages/testpage.dart';
import 'package:citefest/utils/transaction_fee_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  void initState() {
    User? user = getUser();

    if (user == null) return;

    transactionFeeHandler(uid: user.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data != null) {
          return const EnterMPINPage();
        } else {
          return const StartPage();
        }
      },
    );
  }
}
