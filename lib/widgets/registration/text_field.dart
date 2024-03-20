import 'package:flutter/material.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/constants/borders.dart';

class BasicTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String)? onChange;
  final String? hintText;
  final TextInputType? inputType;
  const BasicTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.validator,
      this.hintText,
      this.inputType,
      this.onChange});

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
        TextFormField(
          controller: controller,
          cursorColor: ColorPalette.accentBlack,
          validator: (value) {
            return validator(controller.text);
          },
          onChanged: (value) {
            if (onChange == null) return;
            onChange!(value);
          },
          keyboardType: inputType,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 18.5),
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
            hintText: hintText,
            hintStyle: const TextStyle(
              color: ColorPalette.accentBlack,
              fontFamily: 'Montserrat',
              fontSize: 11.5,
              fontWeight: FontWeight.w300,
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
}
