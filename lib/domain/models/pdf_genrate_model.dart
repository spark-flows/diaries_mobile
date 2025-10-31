// To parse this JSON data, do
//
//     final getPdfModel = getPdfModelFromJson(jsonString);

import 'dart:convert';

GetPdfModel getPdfModelFromJson(String str) => GetPdfModel.fromJson(json.decode(str));

String getPdfModelToJson(GetPdfModel data) => json.encode(data.toJson());

class GetPdfModel {
  String message;
  GetPdfModelData data;
  int status;
  bool isSuccess;

  GetPdfModel({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  factory GetPdfModel.fromJson(Map<String, dynamic> json) => GetPdfModel(
    message: json["Message"],
    data: GetPdfModelData.fromJson(json["Data"]),
    status: json["Status"],
    isSuccess: json["IsSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Data": data.toJson(),
    "Status": status,
    "IsSuccess": isSuccess,
  };
}

class GetPdfModelData {
  String pdfUrl;

  GetPdfModelData({
    required this.pdfUrl,
  });

  factory GetPdfModelData.fromJson(Map<String, dynamic> json) => GetPdfModelData(
    pdfUrl: json["pdfUrl"],
  );

  Map<String, dynamic> toJson() => {
    "pdfUrl": pdfUrl,
  };
}
