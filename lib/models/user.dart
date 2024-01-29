import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String studentNumber;
  String email;
  String mpin;
  String birthday;
  String phoneNumber;
  String balance;

  UserModel({
    required this.name,
    required this.studentNumber,
    required this.email,
    required this.mpin,
    required this.birthday,
    required this.phoneNumber,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        studentNumber: json["studentNumber"],
        email: json["email"],
        mpin: json["mpin"],
        birthday: json["birthday"],
        phoneNumber: json["phoneNumber"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "studentNumber": studentNumber,
        "email": email,
        "mpin": mpin,
        "birthday": birthday,
        "phoneNumber": phoneNumber,
        "balance": balance,
      };
}
