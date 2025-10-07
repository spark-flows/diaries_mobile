import 'dart:convert';

ForgotModel forgotModelFromJson(String str) =>
    ForgotModel.fromJson(json.decode(str));

class ForgotModel {
  String? message;
  ForgotData? data;
  int? status;
  bool? isSuccess;

  ForgotModel({this.message, this.data, this.status, this.isSuccess});

  factory ForgotModel.fromJson(Map<String, dynamic> json) => ForgotModel(
    message: json["Message"],
    data: json["Data"] == null ? null : ForgotData.fromJson(json["Data"]),
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

class ForgotData {
  String? content;
  String? iv;

  ForgotData({this.content, this.iv});

  factory ForgotData.fromJson(Map<String, dynamic> json) =>
      ForgotData(content: json["content"], iv: json["iv"]);

  Map<String, dynamic> toJson() => {"content": content, "iv": iv};
}
