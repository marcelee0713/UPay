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
      body: Container(
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
            buildTextField("Full Name", "Surname/Firstname/Middlename", fullNameController),
            buildTextField("Birthday (MM/DD/YY)", "Enter your birthdate", birthdayController),
            buildTextField("Student ID", "Enter your student ID", studentIdController),
            buildTextField("Phone Number", "Enter your phone number", phoneNumberController),
            buildTextField("Email Address", "Enter your email address", emailAddressController),
            buildPasswordField("Create Password", "Enter your password", passwordController, createPasswordVisible),
            buildPasswordField("Confirm Password", "Confirm your password", confirmPasswordController, confirmPassVisible),
            buildTermsAndConditions(),
            const SizedBox(height: 30),
            buildSignUpButton(),
            const SizedBox(height: 10),
            buildAlreadyHaveAccount(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String hintText, TextEditingController controller) {
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
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 18.5),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            hintText: hintText,
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
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget buildPasswordField(String labelText, String hintText, TextEditingController controller, bool passwordVisible) {
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
          obscureText: !passwordVisible,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 18.5),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            hintText: hintText,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: const Color(0xffe8e8e8),
            errorStyle: const TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal,
              color: ColorPalette.errorColor,
              fontSize: 12,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (labelText == "Create Password") {
                    createPasswordVisible = !createPasswordVisible;
                  } else if (labelText == "Confirm Password") {
                    confirmPassVisible = !confirmPassVisible;
                  }
                });
              },
              icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget buildTermsAndConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: isChecked,
            activeColor: ColorPalette.primary,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool;
              });
            }),
        const Text(
          "I agree to the ",
          style: TextStyle(
            color: Colors.black,
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
            ),
          ),
        )
      ],
    );
  }

  Widget buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primary,
        padding: EdgeInsets.symmetric(vertical: 18),
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
            color: Colors.black,
            fontFamily: "Monserrat",
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
              color: ColorPalette.primary,
              fontFamily: "Monserrat",
            ),
          ),
        ),
      ],
    );
  }
}
