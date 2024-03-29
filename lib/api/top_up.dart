import 'package:citefest/api/transactions.dart';
import 'package:citefest/models/top_up_model.dart';
import 'package:citefest/models/transactions.dart';
import 'package:citefest/models/user.dart';
import 'package:citefest/utils/transaction_fee_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<TransactionModel> topUp({required TopUpModel data}) async {
  FirebaseFirestore db = FirebaseFirestore.instance;

  try {
    // Fetch Users Data
    DocumentSnapshot senderBody = await FirebaseFirestore.instance
        .collection('users')
        .doc(data.senderUid)
        .get();

    UserModel sender = UserModel.fromSnapshot(senderBody);
    UserModel? receiver;
    String receiverUid = "";

    QuerySnapshot users =
        await FirebaseFirestore.instance.collection('users').get();

    List<QueryDocumentSnapshot> documents = users.docs;

    for (var document in documents) {
      Map<String, dynamic> dataJson = document.data() as Map<String, dynamic>;

      UserModel user = UserModel.fromJson(dataJson);

      if (user.studentNumber == data.receiverStudentNumber) {
        receiverUid = document.id;
        receiver = user;
        break;
      }
    }

    if (receiver == null) throw "User does not exist!";

    if (receiver.studentNumber == sender.studentNumber) {
      throw "Sender and Receiver ID is the same!";
    }

    // Update Balances

    String senderUpdatedBalance =
        (double.parse(sender.balance) - double.parse(data.totalExpenses))
            .toString();

    double senderAfterBalance = double.parse(senderUpdatedBalance);

    if (senderAfterBalance < 0) throw "Not enough balance";

    double senderEarnedPoints =
        double.parse(sender.upoints) + 0.2 * int.parse(data.transactionFee);

    String receiverUpdatedBalance =
        (double.parse(receiver.balance) + double.parse(data.moneyToSend))
            .toString();

    sender.upoints = senderEarnedPoints.toString();
    sender.balance = senderUpdatedBalance;
    receiver.balance = receiverUpdatedBalance;

    await db.collection("users").doc(data.senderUid).set(sender.toJson());
    await db.collection("users").doc(receiverUid).set(receiver.toJson());
    await updateTransactionDate(userData: sender, uid: data.senderUid);
    await updateTransactionCount(userData: sender, uid: data.senderUid);

    // Set sender's user points base on the transaction fee
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('MMM dd yyyy').format(now);
    String formattedTime = DateFormat('h:mm a').format(now);

    TransactionModel senderTransaction = TransactionModel(
      uid: data.senderUid,
      createdAt: formattedDate,
      amount: data.moneyToSend,
      amountType: "decrease",
      type: "Top up",
      recipient: receiver.name,
      note: "",
      desc: "You've successfully sent money to ${receiver.studentNumber}",
      time: formattedTime,
      pointsEarned: (0.2 * int.parse(data.transactionFee)).toString(),
      senderLeftHeadText: "From",
      senderLeftSubText: "E-Wallet",
      senderRightHeadText: sender.name,
      senderRightSubText: "UPay",
      recipientLeftHeadText: "To",
      recipientLeftSubText: "E-Wallet",
      recipientRightHeadText: receiver.name,
      recipientRightSubText: "UPay",
    );

    TransactionModel receiverTransaction = TransactionModel(
      uid: receiverUid,
      createdAt: formattedDate,
      amount: data.moneyToSend,
      amountType: "increase",
      type: "Top up",
      recipient: sender.name,
      note: data.note ?? "",
      desc: "You received money from ${sender.studentNumber}",
      time: formattedTime,
      pointsEarned: '',
      senderLeftHeadText: "From",
      senderLeftSubText: "E-Wallet",
      senderRightHeadText: sender.name,
      senderRightSubText: "UPay",
      recipientLeftHeadText: "To",
      recipientLeftSubText: "E-Wallet",
      recipientRightHeadText: receiver.name,
      recipientRightSubText: "UPay",
    );

    await apiSetTransactions(transaction: senderTransaction);
    await apiSetTransactions(transaction: receiverTransaction);

    return senderTransaction;
  } catch (err) {
    if (err is FirebaseException) {
      throw "Error: ${err.message}";
    }

    throw "Error: ${err.toString()}";
  }
}
