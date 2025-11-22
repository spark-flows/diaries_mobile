// To parse this JSON data, do
//
//     final getOneConcept = getOneConceptFromJson(jsonString);

import 'dart:convert';

GetOneConcept getOneConceptFromJson(String str) =>
    GetOneConcept.fromJson(json.decode(str));

String getOneConceptToJson(GetOneConcept data) => json.encode(data.toJson());

class GetOneConcept {
  final String message;
  final GetOneConceptData data;
  final int status;
  final bool isSuccess;

  GetOneConcept({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  GetOneConcept copyWith({
    String? message,
    GetOneConceptData? data,
    int? status,
    bool? isSuccess,
  }) => GetOneConcept(
    message: message ?? this.message,
    data: data ?? this.data,
    status: status ?? this.status,
    isSuccess: isSuccess ?? this.isSuccess,
  );

  factory GetOneConcept.fromJson(Map<String, dynamic> json) => GetOneConcept(
    message: json["Message"],
    data: GetOneConceptData.fromJson(json["Data"]),
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

class GetOneConceptData {
  final String? id;
  final String? name;
  final String? conceptno;
  final DateTime? startDate;
  final DateTime? endDate;
  final GetOneConceptCategory? designer;
  final String? designno;
  final String? nodesignMade;
  final String? goldWt;
  final String? diamondWt;
  final GetOneConceptCategory? category;
  final GetOneConceptCategory? style;
  final String? status;
  final List<String>? images;
  final String? remark1;
  final String? remark2;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetOneConceptData({
    required this.id,
    required this.name,
    required this.conceptno,
    required this.startDate,
    required this.endDate,
    required this.designer,
    required this.designno,
    required this.nodesignMade,
    required this.goldWt,
    required this.diamondWt,
    required this.category,
    required this.style,
    required this.status,
    required this.images,
    required this.remark1,
    required this.remark2,
    required this.createdAt,
    required this.updatedAt,
  });

  GetOneConceptData copyWith({
    String? id,
    String? name,
    String? conceptno,
    DateTime? startDate,
    DateTime? endDate,
    GetOneConceptCategory? designer,
    String? designno,
    String? nodesignMade,
    String? goldWt,
    String? diamondWt,
    GetOneConceptCategory? category,
    GetOneConceptCategory? style,
    String? status,
    List<String>? images,
    String? remark1,
    String? remark2,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => GetOneConceptData(
    id: id ?? this.id,
    name: name ?? this.name,
    conceptno: conceptno ?? this.conceptno,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    designer: designer ?? this.designer,
    designno: designno ?? this.designno,
    nodesignMade: nodesignMade ?? this.nodesignMade,
    goldWt: goldWt ?? this.goldWt,
    diamondWt: diamondWt ?? this.diamondWt,
    category: category ?? this.category,
    style: style ?? this.style,
    status: status ?? this.status,
    images: images ?? this.images,
    remark1: remark1 ?? this.remark1,
    remark2: remark2 ?? this.remark2,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory GetOneConceptData.fromJson(Map<String, dynamic> json) =>
      GetOneConceptData(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        conceptno: json["conceptno"] ?? "",
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        designer: GetOneConceptCategory.fromJson(json["designer"]),
        designno: json["designno"] ?? "",
        nodesignMade: json["nodesign_made"] ?? "",
        goldWt: json["gold_wt"] ?? "",
        diamondWt: json["diamond_wt"] ?? "",
        category: GetOneConceptCategory.fromJson(json["category"]),
        style: GetOneConceptCategory.fromJson(json["style"]),
        status: json["status"] ?? "",
        images:
            json["images"] == null
                ? []
                : List<String>.from(json["images"].map((x) => x)),
        remark1: json["remark1"] ?? "",
        remark2: json["remark2"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "conceptno": conceptno,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "designer": designer?.toJson(),
    "designno": designno,
    "nodesign_made": nodesignMade,
    "gold_wt": goldWt,
    "diamond_wt": diamondWt,
    "category": category?.toJson(),
    "style": style?.toJson(),
    "status": status,
    "images": images != null ?List<dynamic>.from(images!.map((x) => x)) : [],
    "remark1": remark1,
    "remark2": remark2,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class GetOneConceptCategory {
  final String id;
  final String name;

  GetOneConceptCategory({required this.id, required this.name});

  GetOneConceptCategory copyWith({String? id, String? name}) =>
      GetOneConceptCategory(id: id ?? this.id, name: name ?? this.name);

  factory GetOneConceptCategory.fromJson(Map<String, dynamic> json) =>
      GetOneConceptCategory(id: json["_id"] ?? "", name: json["name"] ?? "");

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
