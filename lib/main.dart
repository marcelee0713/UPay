import 'package:citefest/auth_check.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/firebase_options.dart';
import 'package:citefest/pages/analytics_page.dart';
import 'package:citefest/pages/create_mpin_page.dart';
import 'package:citefest/pages/enter_mpin_page.dart';
import 'package:citefest/pages/log_in_page.dart';
import 'package:citefest/pages/page_handler.dart';
import 'package:citefest/pages/profile_page.dart';
import 'package:citefest/pages/receipt_page.dart';
import 'package:citefest/pages/registration_page.dart';
import 'package:citefest/pages/start_page.dart';
import 'package:citefest/pages/testpage.dart';
import 'package:citefest/pages/vouchers_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await Hive.openBox("myRegistrationBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      title: 'UPay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorPalette.primary,
          secondary: ColorPalette.secondary,
        ),
      ),
      initialRoute: '/auth',
      routes: {
        "/auth": (context) => const AuthCheck(),
        "/start": (context) => const StartPage(),
        "/login": (context) => const SignInPage(),
        "/enter-mpin": (context) => const EnterMPINPage(),
        "/registration": (context) => const RegistrationPage(),
        "/create-mpin": (context) => const CreateMPINPage(),
        "/": (context) => const PageHandler(),
        "/receipt_page": (context) =>
            const ReceiptPage(), // Possibly make a necessary properties for this page.
        "/testpage": (context) => const TestPage(),
      },
    );
  }
}
