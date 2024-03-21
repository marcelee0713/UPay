import 'dart:convert';

TopUpModel topUpModelFromJson(String str) =>
    TopUpModel.fromJson(json.decode(str));

String topUpModelToJson(TopUpModel data) => json.encode(data.toJson());

class TopUpModel {
  String receiverStudentNumber;
  String senderUid;
  String moneyToSend;
  String totalExpenses;
  String transactionFee;
  String? note;

  TopUpModel({
    required this.receiverStudentNumber,
    required this.senderUid,
    required this.moneyToSend,
    required this.totalExpenses,
    required this.transactionFee,
    this.note,
  });

  factory TopUpModel.fromJson(Map<String, dynamic> json) => TopUpModel(
        receiverStudentNumber: json["receiverStudentNumber"],
        senderUid: json["senderUid"],
        moneyToSend: json["moneyToSend"],
        totalExpenses: json["totalExpenses"],
        transactionFee: json["transactionFee"],
        note: json["note"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "receiverStudentNumber": receiverStudentNumber,
        "senderUid": senderUid,
        "moneyToSend": moneyToSend,
        "totalExpenses": totalExpenses,
        "transactionFee": transactionFee,
        "note": note,
      };
}
