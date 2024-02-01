import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class Inputs {
  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ColorPalette.primary,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ColorPalette.errorColor,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );
}
