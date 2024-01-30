import 'dart:convert';

StudentCardModel studentCardModelFromJson(String str) =>
    StudentCardModel.fromJson(json.decode(str));

String studentCardModelToJson(StudentCardModel data) =>
    json.encode(data.toJson());

class StudentCardModel {
  String studentNumber;
  String balance;

  StudentCardModel({
    required this.studentNumber,
    required this.balance,
  });

  factory StudentCardModel.fromJson(Map<String, dynamic> json) =>
      StudentCardModel(
        studentNumber: json["studentNumber"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "studentNumber": studentNumber,
        "balance": balance,
      };
}

class StudentCardRes {
  StudentCardModel? studentCardRes;
  String? errorMessage;

  StudentCardRes({this.studentCardRes, this.errorMessage});
}
