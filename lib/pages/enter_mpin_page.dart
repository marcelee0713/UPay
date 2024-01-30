import 'package:citefest/api/auth.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:citefest/widgets/universal/auth/auth_info.dart';
import 'package:citefest/widgets/universal/auth/mpin_button.dart';
import 'package:citefest/widgets/universal/dialog_info.dart';
import 'package:citefest/widgets/universal/dialog_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EnterMPINPage extends StatefulWidget {
  const EnterMPINPage({super.key});

  @override
  State<EnterMPINPage> createState() => _EnterMPINPageState();
}

class _EnterMPINPageState extends State<EnterMPINPage> {
  TextEditingController controller = TextEditingController(text: "");
  User? user = getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20),
            ArrowBack(
              onTap: () async {
                DialogInfo(
                  headerText: "Confirmation",
                  subText: "This will log you out, are you sure?",
                  confirmText: "Yes",
                  onCancel: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  onConfirm: () async {
                    Navigator.of(context, rootNavigator: true).pop();

                    DialogLoading(subtext: "Logging out...").build(context);

                    await FirebaseAuth.instance.signOut();

                    if (!mounted) return;

                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/start", (route) => false);
                  },
                ).build(context);
              },
            ),
            const SizedBox(height: 20),
            const AuthInfo(
                headText: "Enter your MPIN",
                subText: "do not share your MPIN to anyone"),
            const SizedBox(height: 30),
            Pinput(
              length: 4,
              readOnly: true,
              controller: controller,
              autofocus: true,
              obscureText: true,
              defaultPinTheme: PinTheme(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffE8E8E8),
                ),
                textStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.accentBlack,
                ),
              ),
              focusedPinTheme: PinTheme(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffE8E8E8),
                  border: Border.all(color: ColorPalette.primary, width: 2),
                ),
                textStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.accentBlack,
                ),
              ),
              onCompleted: (value) async {
                DialogLoading(subtext: "Verifying...").build(context);

                bool res = await apiVerifyMPIN(mpinput: value, uid: user!.uid);

                if (!mounted) return;

                Navigator.of(context, rootNavigator: true).pop();

                if (res) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (route) => false);
                  return;
                }

                DialogInfo(
                  headerText: "Error",
                  subText: "Entered MPIN is invalid, please try again",
                  confirmText: "Try again",
                  onCancel: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  onConfirm: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ).build(context);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                child: const Text(
                  "forgot MPIN?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.primary,
                  ),
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 300,
                child: GridView.count(
                  childAspectRatio: (1 / .7),
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: [
                    ...generateNumberButtons(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void enterMPIN(String pin) {
    if (controller.text.length == 4) return;

    setState(() {
      controller.text += pin;
    });
  }

  void deletePIN() {
    if (controller.text.isEmpty) return;

    controller.text = controller.text.substring(0, controller.text.length - 1);
  }

  List<Widget> generateNumberButtons() {
    List<Widget> numberButtons = [];

    for (int i = 1; i <= 10; i++) {
      int number = (i % 10 == 0) ? 0 : i % 10;
      if (number != 0) {
        numberButtons.add(
          MPINBUtton(textName: "$number", onTap: () => enterMPIN("$number")),
        );
      } else {
        numberButtons.add(const SizedBox());
        numberButtons.add(
          MPINBUtton(textName: "$number", onTap: () => enterMPIN("$number")),
        );
        numberButtons.add(
          IconButton(
            onPressed: () => deletePIN(),
            icon: const Icon(
              Icons.backspace,
              color: ColorPalette.primary,
              size: 25,
            ),
          ),
        );
      }
    }

    return numberButtons;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
