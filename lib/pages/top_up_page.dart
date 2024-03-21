import 'package:citefest/api/auth.dart';
import 'package:citefest/api/top_up.dart';
import 'package:citefest/constants/borders.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/models/top_up_model.dart';
import 'package:citefest/pages/receipt_page.dart';
import 'package:citefest/utils/input_validators.dart';
import 'package:citefest/utils/transaction_fee_handler.dart';
import 'package:citefest/widgets/registration/student_id.dart';
import 'package:citefest/widgets/registration/text_field.dart';
import 'package:citefest/widgets/topup/amount_picker_box.dart';
import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:citefest/widgets/universal/dialog_info.dart';
import 'package:citefest/widgets/universal/dialog_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  String transactionFee = "0";
  TextEditingController studentIdController1 = TextEditingController();
  TextEditingController studentIdController2 = TextEditingController();
  TextEditingController studentIdController3 = TextEditingController();

  TextEditingController amountController = TextEditingController(text: "50");
  TextEditingController notesController = TextEditingController();

  int currentIndex = 0;
  String currentValue = "50";
  List<String> availableAmounts = ["50", "100", "200", "500", "800", "1000"];

  final _formKey = GlobalKey<FormState>();

  User? user;

  @override
  void initState() {
    user = getUser();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTransactionFee();
    });
  }

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
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      child: ArrowBack(onTap: () => Navigator.pop(context))),
                  const Text(
                    "Top Up",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: ColorPalette.accentBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              StudentNumberField(
                labelText: "Student Number",
                controller1: studentIdController1,
                controller2: studentIdController2,
                controller3: studentIdController3,
              ),
              BasicTextField(
                labelText: "Amount",
                controller: amountController,
                validator: (p0) => centavosValidator(amountController.text),
                hintText: "enter specific amount without centavos...",
                inputType: TextInputType.number,
                onChange: (p0) {
                  if (availableAmounts.contains(p0)) {
                    setState(() {
                      currentIndex = availableAmounts.indexOf(p0);
                    });
                  } else {
                    setState(() {
                      currentIndex = -1;
                    });
                  }
                },
              ),
              Row(
                children: [
                  AmountPickerBox(
                    currentIndex: currentIndex,
                    index: 0,
                    amount: "50.00",
                    transacFee: transactionFee,
                    onTap: () => setState(() {
                      currentIndex = 0;
                      amountController.text = "50";
                      amountController.selection = TextSelection.collapsed(
                        offset: amountController.text.length,
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  AmountPickerBox(
                    currentIndex: currentIndex,
                    index: 1,
                    amount: "100.00",
                    transacFee: transactionFee,
                    onTap: () => setState(() {
                      currentIndex = 1;
                      amountController.text = "100";
                      amountController.selection = TextSelection.collapsed(
                        offset: amountController.text.length,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AmountPickerBox(
                    currentIndex: currentIndex,
                    index: 2,
                    amount: "200.00",
                    transacFee: transactionFee,
                    onTap: () => setState(() {
                      currentIndex = 2;
                      amountController.text = "200";
                      amountController.selection = TextSelection.collapsed(
                        offset: amountController.text.length,
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  AmountPickerBox(
                    currentIndex: currentIndex,
                    index: 3,
                    amount: "500.00",
                    transacFee: transactionFee,
                    onTap: () => setState(() {
                      currentIndex = 3;
                      amountController.text = "500";
                      amountController.selection = TextSelection.collapsed(
                        offset: amountController.text.length,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  AmountPickerBox(
                    currentIndex: currentIndex,
                    index: 4,
                    amount: "800.00",
                    transacFee: transactionFee,
                    onTap: () => setState(() {
                      currentIndex = 4;
                      amountController.text = "800";
                      amountController.selection = TextSelection.collapsed(
                        offset: amountController.text.length,
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  AmountPickerBox(
                    currentIndex: currentIndex,
                    index: 5,
                    amount: "1000.00",
                    transacFee: transactionFee,
                    onTap: () => setState(() {
                      currentIndex = 5;
                      amountController.text = "1000";
                      amountController.selection = TextSelection.collapsed(
                        offset: amountController.text.length,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Notes (Optional)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      color: ColorPalette.accentBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: notesController,
                    cursorColor: ColorPalette.accentBlack,
                    maxLength: 30,
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
                      counterText: "",
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
              ),
              const Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "Go to any establishment partners of ",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: ColorPalette.accentBlack,
                  ),
                  children: [
                    TextSpan(
                      text: "UPay ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: ColorPalette.primary,
                      ),
                    ),
                    TextSpan(
                      text: "for payment*",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: ColorPalette.accentBlack,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  FocusScope.of(context).unfocus();
                  String receiverStudentNumber =
                      "${studentIdController1.text.trim()}-${studentIdController2.text.trim()}-${studentIdController3.text.trim()}";
                  String moneyToSend = amountController.text.trim();
                  String totalExpenses =
                      (int.parse(amountController.text.trim()) +
                              int.parse(transactionFee))
                          .toString();
                  String notes = notesController.text.trim();
                  debugPrint(receiverStudentNumber);
                  debugPrint(totalExpenses);
                  debugPrint(notes);

                  DialogInfo(
                    headerText: "Are you sure?",
                    subText:
                        "You are going to spend a total of $totalExpenses pesos for sending $moneyToSend pesos to $receiverStudentNumber.",
                    confirmText: "Yes",
                    onCancel: () =>
                        Navigator.of(context, rootNavigator: true).pop(),
                    onConfirm: () async {
                      Navigator.of(context, rootNavigator: true).pop();

                      DialogLoading(
                        subtext: "Loading...",
                        willPop: false,
                      ).build(context);

                      TopUpModel data = TopUpModel(
                        receiverStudentNumber: receiverStudentNumber,
                        senderUid: user!.uid,
                        moneyToSend: moneyToSend,
                        totalExpenses: totalExpenses,
                        transactionFee: transactionFee,
                        note: notes,
                      );

                      await topUp(data: data).then(
                        (value) {
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReceiptPage(
                                data: value,
                                onExit: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    "/",
                                    (route) => false,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ).catchError(
                        (err) {
                          Navigator.of(context, rootNavigator: true).pop();

                          DialogInfo(
                            headerText: "Failed",
                            subText: err.toString(),
                            confirmText: "Try again",
                            onCancel: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            onConfirm: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                          ).build(context);
                        },
                      );
                    },
                  ).build(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.primary,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Confirm",
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
        ),
      ),
    );
  }

  void getTransactionFee() async {
    String fetchedFee = await fetchTransactionFee(uid: user!.uid);
    setState(() {
      transactionFee = fetchedFee;
    });
  }

  @override
  void dispose() {
    studentIdController1.dispose();
    studentIdController2.dispose();
    studentIdController3.dispose();
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
