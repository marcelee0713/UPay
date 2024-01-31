import 'package:flutter/material.dart';

String? firstNameValidator(String? value) {
  if (value!.isNotEmpty) return null;

  return "Enter your first name.";
}

String? lastNameValidator(String? value) {
  if (value!.isNotEmpty) return null;

  return "Enter your last name.";
}

String? studentNumberValidator(String? value) {
  if (value == null || value.isEmpty) return "Enter your student number";
  String cleanedInput = value.replaceAll(RegExp(r'\D'), '');

  // Check if the cleaned input has the correct length
  if (cleanedInput.length != 12) {
    return "Please follow the format XX-XXXX-XXXXXX.";
  }
  // Extract segments
  String segment1 = cleanedInput.substring(0, 2);
  String segment2 = cleanedInput.substring(2, 6);
  String segment3 = cleanedInput.substring(6);

  // Check if each segment has the correct length
  if (segment1.length != 2 || segment2.length != 4 || segment3.length != 6) {
    return "Please follow the format XX-XXXX-XXXXXX";
  }

  return null;
}

String? validateDateFormat(String? date) {
  RegExp datePattern = RegExp(r'^\d{2}/\d{2}/\d{2}$');

  if (!datePattern.hasMatch(date!)) {
    return 'Invalid date format. Use MM/DD/YY';
  }

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
