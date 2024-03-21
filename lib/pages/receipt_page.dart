import 'package:citefest/constants/colors.dart';
import 'package:citefest/models/transactions.dart';
import 'package:citefest/utils/money_formatter.dart';
import 'package:citefest/widgets/receipt/receipt_info_box.dart';
import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:flutter/material.dart';

class ReceiptPage extends StatefulWidget {
  final TransactionModel data;
  final VoidCallback onExit;

  const ReceiptPage({
    super.key,
    required this.data,
    required this.onExit,
  });

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onExit;
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorPalette.primary,
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: ArrowBack(onTap: widget.onExit),
                  ),
                  Text(
                    widget.data.type,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: ColorPalette.accentBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 600,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
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
                        const SizedBox(height: 10),
                        Container(
                          height: 20,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorPalette.primary,
                          ),
                          child: Center(
                            child: Text(
                              "+${widget.data.pointsEarned} UPoints",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                color: ColorPalette.accentWhite,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
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
                              widget.data.desc,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                            children: [
                              Text(
                                formatMoney(double.parse(widget.data.amount)),
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  color: ColorPalette.accentBlack,
                                ),
                              ),
                              const Text(
                                "Amount",
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
                            ReceiptInfoBox(
                              leftHeaderText: widget.data.senderLeftHeadText,
                              rightHeaderText: widget.data.senderRightHeadText,
                              leftSubText: widget.data.senderLeftSubText,
                              rightSubText: widget.data.senderRightSubText,
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 1,
                              color: const Color(0xffD9D9D9),
                            ),
                            const SizedBox(height: 10),
                            ReceiptInfoBox(
                              leftHeaderText: widget.data.recipientLeftHeadText,
                              rightHeaderText:
                                  widget.data.recipientRightHeadText,
                              leftSubText: widget.data.recipientLeftSubText,
                              rightSubText: widget.data.recipientRightSubText,
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 1,
                              color: const Color(0xffD9D9D9),
                            ),
                            const SizedBox(height: 10),
                            ReceiptInfoBox(
                              leftHeaderText: "Date",
                              rightHeaderText: widget.data.createdAt,
                              leftSubText: "",
                              rightSubText: widget.data.time,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: widget.onExit,
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
      ),
    );
  }
}
