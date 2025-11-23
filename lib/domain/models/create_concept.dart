import 'dart:convert';

CreateConceptModel createConceptModelFromJson(String str) =>
    CreateConceptModel.fromJson(json.decode(str));

String createConceptModelToJson(CreateConceptModel data) =>
    json.encode(data.toJson());

class CreateConceptModel {
  final String message;
  final CreateConceptModelData data;
  final int status;
  final bool isSuccess;

  CreateConceptModel({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  CreateConceptModel copyWith({
    String? message,
    CreateConceptModelData? data,
    int? status,
    bool? isSuccess,
  }) => CreateConceptModel(
    message: message ?? this.message,
    data: data ?? this.data,
    status: status ?? this.status,
    isSuccess: isSuccess ?? this.isSuccess,
  );

  factory CreateConceptModel.fromJson(Map<String, dynamic> json) =>
      CreateConceptModel(
        message: json["Message"],
        data: CreateConceptModelData.fromJson(json["Data"]),
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

class CreateConceptModelData {
  final String? id;
  final String? name;
  final String? conceptno;
  final DateTime? startDate;
  final DateTime? endDate;
  final CreateConceptModelCategory? designer;
  final String? designno;
  final String? nodesignMade;
  final String? goldWt;
  final String? diamondWt;
  final CreateConceptModelCategory? category;
  final CreateConceptModelCategory? style;
  final String? status;
  final List<String>? images;
  final String? remark1;
  final String? remark2;
  final bool? isDeleted;
  final String? deletedBy;
  final String? createdBy;
  final String? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  CreateConceptModelData({
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
    required this.isDeleted,
    required this.deletedBy,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  CreateConceptModelData copyWith({
    String? id,
    String? name,
    String? conceptno,
    DateTime? startDate,
    DateTime? endDate,
    CreateConceptModelCategory? designer,
    String? designno,
    String? nodesignMade,
    String? goldWt,
    String? diamondWt,
    CreateConceptModelCategory? category,
    CreateConceptModelCategory? style,
    String? status,
    List<String>? images,
    String? remark1,
    String? remark2,
    bool? isDeleted,
    String? deletedBy,
    String? createdBy,
    String? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) => CreateConceptModelData(
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
    isDeleted: isDeleted ?? this.isDeleted,
    deletedBy: deletedBy ?? this.deletedBy,
    createdBy: createdBy ?? this.createdBy,
    updatedBy: updatedBy ?? this.updatedBy,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );

  factory CreateConceptModelData.fromJson(
    Map<String, dynamic> json,
  ) => CreateConceptModelData(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    conceptno: json["conceptno"] ?? "",
    startDate:
        json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    designer:
        json["designer"] == null
            ? null
            : CreateConceptModelCategory.fromJson(json["designer"]),
    designno: json["designno"] ?? "",
    nodesignMade: json["nodesign_made"] ?? "",
    goldWt: json["gold_wt"] ?? "",
    diamondWt: json["diamond_wt"] ?? "",
    category:
        json["category"] == null
            ? null
            : CreateConceptModelCategory.fromJson(json["category"]),
    style:
        json["style"] == null
            ? null
            : CreateConceptModelCategory.fromJson(json["style"]),
    status: json["status"] ?? "",
    images:
        json["images"] == null
            ? []
            : List<String>.from(json["images"].map((x) => x)),
    remark1: json["remark1"] ?? "",
    remark2: json["remark2"] ?? "",
    isDeleted: json["isDeleted"] ?? false,
    deletedBy: json["deletedBy"] ?? "",
    createdBy: json["createdBy"] ?? "",
    updatedBy: json["updatedBy"] ?? "",
    createdAt: json["createdAt"] ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] ?? 0,
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
    "images": images != null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "remark1": remark1,
    "remark2": remark2,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class CreateConceptModelCategory {
  final String id;
  final String name;

  CreateConceptModelCategory({required this.id, required this.name});

  CreateConceptModelCategory copyWith({String? id, String? name}) =>
      CreateConceptModelCategory(id: id ?? this.id, name: name ?? this.name);

  factory CreateConceptModelCategory.fromJson(Map<String, dynamic> json) =>
      CreateConceptModelCategory(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
