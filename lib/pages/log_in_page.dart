import 'package:citefest/constants/colors.dart';
import 'package:citefest/pages/registration_page.dart';
import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:citefest/widgets/universal/auth/auth_info.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _inputControllerEmail = TextEditingController();
  final _inputControllerPassword = TextEditingController();
  bool _passwordVisible = false;

  OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ColorPalette.primary,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ColorPalette.errorColor,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(height: 20),
              ArrowBack(onTap: () {}),
              const SizedBox(height: 20),
              const AuthInfo(
                  headText: "Log in your account",
                  subText: "new vouchers just for you"),
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " email",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.accentBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _inputControllerEmail,
                    cursorColor: ColorPalette.accentBlack,
                    validator: (value) {
                      final bool emailValid =
                          RegExp(r"^[A-Za-z0-9._%+-]+@phinmaed\.com$")
                              .hasMatch(value!);
                      if (emailValid && value.isNotEmpty) {
                        return null;
                      } else if (!emailValid && value.isNotEmpty) {
                        return "Invalid email, please use @phinmaed.com";
                      } else {
                        return "Please provide an email";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18.5),
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder,
                      filled: true,
                      fillColor: const Color(0xffE8E8E8),
                      errorStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                        color: ColorPalette.errorColor,
                        fontSize: 12,
                      ),
                    ),
                    style: const TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "  password",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.accentBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _inputControllerPassword,
                    obscureText: !_passwordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    cursorColor: ColorPalette.accentBlack,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length >= 8) {
                        return null;
                      } else if (value.length <= 7 && value.isNotEmpty) {
                        return "Password must contain at least 8 character(s)";
                      } else {
                        return "Please provide a password";
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18.5),
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: errorBorder,
                      suffixIcon: IconButton(
                        color: ColorPalette.primary,
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ColorPalette.primary,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xffE8E8E8),
                      errorStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                        color: ColorPalette.errorColor,
                        fontSize: 12,
                      ),
                    ),
                    style: const TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot password",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  backgroundColor: ColorPalette.primary,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Log in",
                  style: TextStyle(
                    color: Color.fromARGB(255, 235, 229, 229),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorPalette.accentBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationPage()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorPalette.primary,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
