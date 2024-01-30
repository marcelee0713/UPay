import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class DialogInfo {
  final String headerText;
  final String subText;
  final String? cancelText;
  final String confirmText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  DialogInfo({
    required this.headerText,
    required this.subText,
    this.cancelText,
    required this.confirmText,
    required this.onCancel,
    required this.onConfirm,
  });

  build(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: const BoxDecoration(
                  color: ColorPalette.accentWhite,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 150,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      headerText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ColorPalette.accentBlack,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorPalette.accentBlack,
                        overflow: subText.length >= 55
                            ? TextOverflow.ellipsis
                            : TextOverflow.visible,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: onCancel,
                            child: Text(
                              cancelText ?? "Cancel",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: ColorPalette.accentBlack,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onConfirm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPalette.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              confirmText,
                              style: const TextStyle(
                                color: ColorPalette.accentWhite,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
