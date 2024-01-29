import 'package:citefest/constants/strings.dart';
import 'package:citefest/widgets/universal/dialog_info.dart';
import 'package:flutter/material.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:citefest/widgets/universal/auth/auth_info.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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

  final _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool createPasswordVisible = false;
  bool confirmPassVisible = false;
  bool? isChecked = false;

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
                  headText: "Create an account",
                  subText: "hurry and get new user deals"),
              const SizedBox(height: 60),
              buildTextField("Full Name", fullNameController,
                  (p0) => fullNameValidator(fullNameController.text)),
              buildTextField("Birthday (MM/DD/YY)", birthdayController,
                  (p0) => validateDateFormat(birthdayController.text)),
              buildTextField("Student ID", studentIdController,
                  (p0) => studentNumberValidator(studentIdController.text)),
              buildTextField("Phone Number", phoneNumberController,
                  (p0) => phoneNumberValidator(phoneNumberController.text)),
              buildTextField("Email Address", emailAddressController,
                  (p0) => phinmaedEmailValidator(emailAddressController.text)),
              buildPasswordField(
                  "Create Password",
                  passwordController,
                  createPasswordVisible,
                  (p0) => passwordValidator(passwordController.text)),
              const SizedBox(height: 20),
              buildPasswordField(
                  "Confirm Password",
                  confirmPasswordController,
                  confirmPassVisible,
                  (p0) => cfrmPassValidator(confirmPasswordController.text)),
              const SizedBox(height: 5),
              buildTermsAndConditions(),
              const SizedBox(height: 20),
              buildSignUpButton(),
              const SizedBox(height: 10),
              buildAlreadyHaveAccount(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      Function(String) validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            color: ColorPalette.accentBlack,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          cursorColor: ColorPalette.accentBlack,
          validator: (value) {
            return validator(controller.text);
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 18.5),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: const Color(0xffe8e8e8),
            errorStyle: const TextStyle(
              fontFamily: "Montserrat",
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
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildPasswordField(String labelText, TextEditingController controller,
      bool passwordVisible, Function(String) validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            color: ColorPalette.accentBlack,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            return validator(controller.text);
          },
          obscureText: !passwordVisible,
          cursorColor: ColorPalette.accentBlack,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 18.5),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: const Color(0xffe8e8e8),
            errorStyle: const TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal,
              color: ColorPalette.errorColor,
              fontSize: 12,
            ),
            errorMaxLines: 2,
            suffixIcon: IconButton(
              color: ColorPalette.primary,
              onPressed: () {
                setState(() {
                  if (labelText == "Create Password") {
                    createPasswordVisible = !createPasswordVisible;
                  } else if (labelText == "Confirm Password") {
                    confirmPassVisible = !confirmPassVisible;
                  }
                });
              },
              icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off),
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
    );
  }

  Widget buildTermsAndConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Transform.scale(
            scale: 0.7,
            child: Checkbox(
                value: isChecked,
                activeColor: ColorPalette.primary,
                onChanged: (newBool) {
                  setState(() {
                    isChecked = newBool;
                  });
                }),
          ),
        ),
        const Text(
          "By Signing up, I agree to the ",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontSize: 11,
            fontWeight: FontWeight.w300,
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("Terms and Conditions Tapped");
          },
          child: const Text(
            "Terms and Conditions",
            style: TextStyle(
              color: ColorPalette.primary,
              fontFamily: 'Montserrat',
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }

  Widget buildSignUpButton() {
    return ElevatedButton(
      onPressed: () async {
        if (!_formKey.currentState!.validate()) return;

        if (!isChecked!) {
          DialogInfo(
            headerText: "Can not sign up",
            subText: "You have to agree of our Terms and Condition first!",
            confirmText: "OK",
            onCancel: () => Navigator.of(context, rootNavigator: true).pop(),
            onConfirm: () {
              Navigator.of(context, rootNavigator: true).pop();
              setState(() {
                isChecked = true;
              });
            },
          ).build(context);
        }

        String fullName = fullNameController.text;
        String birthday = birthdayController.text;
        String userId = studentIdController.text;
        String phoneNumber = phoneNumberController.text;
        String email = emailAddressController.text;
        String password = confirmPasswordController.text;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primary,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        "Sign Up",
        style: TextStyle(
          color: ColorPalette.accentWhite,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget buildAlreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorPalette.accentBlack,
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("Log In Tapped");
            // Navigate to the login page
            // Add the necessary navigation code here
          },
          child: const Text(
            "Log In",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorPalette.primary,
            ),
          ),
        ),
      ],
    );
  }

  String? fullNameValidator(String? value) {
    if (value!.isNotEmpty) return null;

    return "Enter your full name.";
  }

  String? validateDateFormat(String? date) {
    RegExp datePattern = RegExp(r'^\d{2}/\d{2}/\d{2}$');

    if (!datePattern.hasMatch(date!)) {
      return 'Invalid date format. Use MM/DD/YY';
    }

    return null;
  }

  String? studentNumberValidator(String? value) {
    final bool studentIdValid = RegExp(r"^[0-9-]+$").hasMatch(value!);
    if (studentIdValid && value.length >= 10) {
      return null;
    } else if (value.length <= 9 && value.isNotEmpty) {
      return "Input is too short.";
    } else if (value.isEmpty) {
      return "Enter Input.";
    } else {
      return "Enter valid school ID.";
    }
  }

  String? phoneNumberValidator(String? value) {
    final bool phoneValid = RegExp(r"^(09|\+639)\d{9}$").hasMatch(value!);
    if (phoneValid) {
      return null;
    } else if (value.length <= 11 && !phoneValid) {
      return "Please use +63 phone number format";
    } else if (value.length <= 10 && value.isNotEmpty) {
      return "Input is too short.";
    } else {
      return "Enter an input.";
    }
  }

  String? phinmaedEmailValidator(String? value) {
    const String expectedDomain = '@phinmaed.com';

    if (value!.isEmpty) return "Enter your email.";

    if (value.endsWith('@$expectedDomain')) {
      return 'Invalid email domain. Use @$expectedDomain';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    final bool passwordValid = RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-.+=_]).{8,}$")
        .hasMatch(value!);
    if (passwordValid) {
      return null;
    }

    return "Password must be at least 8 characters, at least one uppercase, number, and special characters.";
  }

  String? cfrmPassValidator(String? value) {
    final bool cfrmPasswordValid =
        passwordController.text == confirmPasswordController.text;
    if (cfrmPasswordValid) {
      return null;
    } else if (value!.isEmpty) {
      return 'Enter input.';
    } else {
      return "Password not match";
    }
  }
}
