import 'dart:convert';

ProfileCardModel profileCardModelFromJson(String str) =>
    ProfileCardModel.fromJson(json.decode(str));

String profileCardModelToJson(ProfileCardModel data) =>
    json.encode(data.toJson());

class ProfileCardModel {
  String name;
  String balance;

  ProfileCardModel({
    required this.name,
    required this.balance,
  });

  factory ProfileCardModel.fromJson(Map<String, dynamic> json) =>
      ProfileCardModel(
        name: json["name"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "balance": balance,
      };
}

class ProfileCardRes {
  ProfileCardModel? data;
  String? errorMessage;

  ProfileCardRes({this.data, this.errorMessage});
}
