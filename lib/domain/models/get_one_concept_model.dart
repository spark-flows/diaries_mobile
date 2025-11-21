import 'dart:convert';

GetOneConcept getOneConceptFromJson(String str) =>
    GetOneConcept.fromJson(json.decode(str));

String getOneConceptToJson(GetOneConcept data) => json.encode(data.toJson());

class GetOneConcept {
  final String message;
  final Data data;
  final int status;
  final bool isSuccess;

  GetOneConcept({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  factory GetOneConcept.fromJson(Map<String, dynamic> json) => GetOneConcept(
    message: json["Message"],
    data: Data.fromJson(json["Data"]),
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

class Data {
  final String? id;
  final String? name;
  final String? conceptno;
  final DateTime? startDate;
  final DateTime? endDate;
  final Category? designer;
  final String? designno;
  final String? nodesignMade;
  final String? goldWt;
  final String? diamondWt;
  final Category? category;
  final Category? style;
  final String? status;
  final List<String>? images;
  final String? remark1;
  final String? remark2;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    conceptno: json["conceptno"] ?? "",
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    designer:
        json["designer"] == null ? null : Category.fromJson(json["designer"]),
    designno: json["designno"] ?? "",
    nodesignMade: json["nodesign_made"] ?? "",
    goldWt: json["gold_wt"] ?? "",
    diamondWt: json["diamond_wt"] ?? "",
    category:
        json["category"] == null
            ? json["category"]
            : Category.fromJson(json["category"]),
    style:
        json["style"] == null
            ? json["style"]
            : Category.fromJson(json["style"]),
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
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "remark1": remark1,
    "remark2": remark2,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["_id"] ?? "", name: json["name"] ?? "");

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
