import 'package:citefest/utils/input_validators.dart';
import 'package:citefest/widgets/registration/birth_of_date.dart';
import 'package:citefest/widgets/registration/password_field.dart';
import 'package:citefest/widgets/registration/student_id.dart';
import 'package:citefest/widgets/registration/text_field.dart';
import 'package:citefest/widgets/universal/dialog_info.dart';
import 'package:flutter/material.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:citefest/widgets/universal/auth/auth_info.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _myRegBox = Hive.box('myRegistrationBox');

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

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController studentIdController1 = TextEditingController();
  TextEditingController studentIdController2 = TextEditingController();
  TextEditingController studentIdController3 = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool createPasswordVisible = false;
  bool confirmPassVisible = false;
  bool? isChecked = false;

  DateTime selectedDate = DateTime.now();

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
              ArrowBack(onTap: () => Navigator.pop(context)),
              const SizedBox(height: 20),
              const AuthInfo(
                headText: "Create an account",
                subText: "hurry and get new user deals",
              ),
              const SizedBox(height: 60),
              BasicTextField(
                labelText: "First Name",
                controller: firstNameController,
                validator: (p0) => firstNameValidator(firstNameController.text),
              ),
              BasicTextField(
                labelText: "Last Name",
                controller: lastNameController,
                validator: (p0) => lastNameValidator(lastNameController.text),
              ),
              BirthOfDateField(
                labelText: "Birth of Date",
                controller: birthdayController,
              ),
              StudentNumberField(
                labelText: "Student Number",
                controller1: studentIdController1,
                controller2: studentIdController2,
                controller3: studentIdController3,
              ),
              BasicTextField(
                labelText: "Phone Number",
                controller: phoneNumberController,
                validator: (p0) =>
                    phoneNumberValidator(phoneNumberController.text),
              ),
              BasicTextField(
                labelText: "Email Address",
                controller: emailAddressController,
                validator: (p0) =>
                    phinmaedEmailValidator(emailAddressController.text),
              ),
              PasswordField(
                controller: passwordController,
                labelText: "Create Password",
                validator: (p0) => passwordValidator(passwordController.text),
              ),
              const SizedBox(height: 20),
              PasswordField(
                controller: confirmPasswordController,
                labelText: "Confirm Password",
                validator: (p0) => cfrmPassValidator(
                  confirmPasswordController.text,
                  passwordController,
                  confirmPasswordController,
                ),
              ),
              const SizedBox(height: 5),
              buildTermsAndConditions(),
              const SizedBox(height: 20),
              buildSignUpButton(),
              const SizedBox(height: 10),
              buildAlreadyHaveAccount(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
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
          return;
        }

        String name =
            "${firstNameController.text.trim()} ${lastNameController.text.trim()}";
        String birthday = birthdayController.text.trim();
        String userId =
            "${studentIdController1.text.trim()}-${studentIdController2.text.trim()}-${studentIdController3.text.trim()}";
        String phoneNumber = phoneNumberController.text.trim();
        String email = emailAddressController.text.trim();
        String password = confirmPasswordController.text.trim();

        _myRegBox.put("fullName", name);
        _myRegBox.put("birthday", birthday);
        _myRegBox.put("userId", userId);
        _myRegBox.put("phoneNumber", phoneNumber);
        _myRegBox.put("email", email);
        _myRegBox.put("password", password);

        Navigator.pushNamed(context, "/create-mpin");
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

  Widget buildAlreadyHaveAccount(BuildContext context) {
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
            Navigator.pop(context);
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

  @override
  void dispose() {
    firstNameController.dispose();
    birthdayController.dispose();
    studentIdController1.dispose();
    studentIdController2.dispose();
    studentIdController3.dispose();
    phoneNumberController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
