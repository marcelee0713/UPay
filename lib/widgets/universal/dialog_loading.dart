import 'package:flutter/material.dart';
import 'package:citefest/constants/colors.dart';

class DialogLoading {
  final String subtext;

  DialogLoading({required this.subtext});

  build(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorPalette.bgColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: ColorPalette.primary,
                      )),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtext,
                      style: const TextStyle(
                        color: ColorPalette.accentBlack,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
