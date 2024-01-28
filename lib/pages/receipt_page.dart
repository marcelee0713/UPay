import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/receipt/receipt_info_box.dart';
import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20),
            ArrowBack(onTap: () {}),
            const SizedBox(height: 2.5),
            const Text(
              "Transfer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: ColorPalette.accentBlack,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 575,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              decoration: BoxDecoration(
                color: ColorPalette.accentWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          color: ColorPalette.bgColor,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: ColorPalette.primary,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Success",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: ColorPalette.accentBlack,
                            ),
                          ),
                          Text(
                            "You've successfully transferred money.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: ColorPalette.accentBlack,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Container(
                        height: 85,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "P 450,000",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: ColorPalette.accentBlack,
                              ),
                            ),
                            Text(
                              "Request Amount",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: ColorPalette.accentBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Column(
                        children: [
                          const ReceiptInfoBox(
                            leftHeaderText: "From",
                            rightHeaderText: "Grace Magicarp",
                            leftSubText: "Credit Card",
                            rightSubText: "UPay*03252",
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 1,
                            color: const Color(0xffD9D9D9),
                          ),
                          const SizedBox(height: 10),
                          const ReceiptInfoBox(
                            leftHeaderText: "To",
                            rightHeaderText: "BJ Mouko",
                            leftSubText: "Credit Card",
                            rightSubText: "UPay*03336",
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 1,
                            color: const Color(0xffD9D9D9),
                          ),
                          const SizedBox(height: 10),
                          const ReceiptInfoBox(
                            leftHeaderText: "Date",
                            rightHeaderText: "20, April 2024",
                            leftSubText: "",
                            rightSubText: "10:34 am",
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: ColorPalette.primary,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        color: ColorPalette.accentWhite,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
