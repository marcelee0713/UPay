import 'package:citefest/auth_check.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/firebase_options.dart';
import 'package:citefest/pages/auth/create_mpin_page.dart';
import 'package:citefest/pages/auth/enter_mpin_page.dart';
import 'package:citefest/pages/auth/log_in_page.dart';
import 'package:citefest/pages/page_handler.dart';
import 'package:citefest/pages/auth/registration_page.dart';
import 'package:citefest/pages/auth/start_page.dart';
import 'package:citefest/pages/testpage.dart';
import 'package:citefest/pages/top_up_page.dart';
import 'package:citefest/pages/transfer_to_page.dart';
import 'package:citefest/utils/index_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await Hive.openBox("myRegistrationBox");
  await Hive.openBox("sessions");

  runApp(
    ChangeNotifierProvider(
      create: (context) => PageIndexProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      debugShowCheckedModeBanner: false,
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
        "/transfer_to_page": (context) => const TransferTo(),
        "/top_up_page": (context) => const TopUpPage(),
        "/testpage": (context) => const TestPage(),
      },
    );
  }
}
