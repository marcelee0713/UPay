import 'package:citefest/utils/input_validators.dart';
import 'package:flutter/material.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/constants/borders.dart';

class StudentNumberField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  const StudentNumberField(
      {super.key,
      required this.labelText,
      required this.controller1,
      required this.controller2,
      required this.controller3});

  @override
  Widget build(BuildContext context) {
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
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller1,
                cursorColor: ColorPalette.accentBlack,
                validator: (value) {
                  return studentNumber1Validator(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 18.5),
                  enabledBorder: Inputs.enabledBorder,
                  focusedBorder: Inputs.focusedBorder,
                  errorBorder: Inputs.errorBorder,
                  focusedErrorBorder: Inputs.errorBorder,
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
            ),
            const SizedBox(width: 5),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller2,
                cursorColor: ColorPalette.accentBlack,
                validator: (value) {
                  return studentNumber2Validator(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 18.5),
                  enabledBorder: Inputs.enabledBorder,
                  focusedBorder: Inputs.focusedBorder,
                  errorBorder: Inputs.errorBorder,
                  focusedErrorBorder: Inputs.errorBorder,
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
            ),
            const SizedBox(width: 5),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller3,
                cursorColor: ColorPalette.accentBlack,
                validator: (value) {
                  return studentNumber3Validator(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 18.5),
                  enabledBorder: Inputs.enabledBorder,
                  focusedBorder: Inputs.focusedBorder,
                  errorBorder: Inputs.errorBorder,
                  focusedErrorBorder: Inputs.errorBorder,
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
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
