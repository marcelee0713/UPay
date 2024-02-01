import 'package:flutter/material.dart';

String? firstNameValidator(String? value) {
  if (value!.isNotEmpty) return null;

  return "Enter your first name.";
}

String? lastNameValidator(String? value) {
  if (value!.isNotEmpty) return null;

  return "Enter your last name.";
}

String? studentNumber1Validator(String? value) {
  if (value == null || value.isEmpty) return "Required.";
  if (value.length < 2) return "Too short.";
  if (value.length > 2) return "Too long.";

  return null;
}

String? studentNumber2Validator(String? value) {
  if (value == null || value.isEmpty) return "Required.";
  if (value.length < 4) return "Too short.";
  if (value.length > 4) return "Too long.";

  return null;
}

String? studentNumber3Validator(String? value) {
  if (value == null || value.isEmpty) return "Required.";
  if (value.length < 4) return "Too short.";
  if (value.length > 6) return "Too long.";

  return null;
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

String? cfrmPassValidator(
    String? value,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController) {
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
