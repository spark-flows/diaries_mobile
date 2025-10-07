import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

class AuthModel {
  String? message;
  Data? data;
  int? status;
  bool? isSuccess;

  AuthModel({this.message, this.data, this.status, this.isSuccess});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    message: json["Message"],
    data:
        json["Data"] == null || json["Data"] == 0
            ? null
            : Data.fromJson(json["Data"]),
    status: json["Status"],
    isSuccess: json["IsSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Data": data?.toJson(),
    "Status": status,
    "IsSuccess": isSuccess,
  };
}

class Data {
  String? accessToken;

  Data({this.accessToken});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(accessToken: json["accessToken"]);

  Map<String, dynamic> toJson() => {"accessToken": accessToken};
}
