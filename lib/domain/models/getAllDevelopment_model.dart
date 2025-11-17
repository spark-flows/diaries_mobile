import 'dart:convert';

DevelopmentModel developmentModelFromJson(String str) =>
    DevelopmentModel.fromJson(json.decode(str));

String developmentModelToJson(DevelopmentModel data) =>
    json.encode(data.toJson());

class DevelopmentModel {
  String? message;
  DevelopmentModelData? data;
  int? status;
  bool? isSuccess;

  DevelopmentModel({this.message, this.data, this.status, this.isSuccess});

  factory DevelopmentModel.fromJson(Map<String, dynamic> json) =>
      DevelopmentModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? null
                : DevelopmentModelData.fromJson(json["Data"]),
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

class DevelopmentModelData {
  List<DevelopmentModelDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? totalGoldWt;
  int? totalDiamondWt;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  DevelopmentModelData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.totalGoldWt,
    this.totalDiamondWt,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory DevelopmentModelData.fromJson(Map<String, dynamic> json) =>
      DevelopmentModelData(
        docs:
            json["docs"] == null
                ? []
                : List<DevelopmentModelDoc>.from(
                  json["docs"]!.map((x) => DevelopmentModelDoc.fromJson(x)),
                ),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        totalGoldWt: json["totalGoldWt"],
        totalDiamondWt: json["totalDiamondWt"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
    "docs":
        docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "totalGoldWt": totalGoldWt,
    "totalDiamondWt": totalDiamondWt,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class DevelopmentModelDoc {
  String? id;
  String? name;
  String? conceptno;
  DateTime? startDate;
  DateTime? endDate;
  Designer? designer;
  String? designno;
  String? goldWt;
  String? diamondWt;
  String? status;
  List<String>? images;
  String? remark1;
  String? remark2;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nodesignMade;
  Category? category;
  Category? style;
  int? totalImages;
  List<String>? previewImages;

  DevelopmentModelDoc({
    this.id,
    this.name,
    this.conceptno,
    this.startDate,
    this.endDate,
    this.designer,
    this.designno,
    this.goldWt,
    this.diamondWt,
    this.status,
    this.images,
    this.remark1,
    this.remark2,
    this.createdAt,
    this.updatedAt,
    this.nodesignMade,
    this.category,
    this.style,
    this.totalImages,
    this.previewImages,
  });

  factory DevelopmentModelDoc.fromJson(
    Map<String, dynamic> json,
  ) => DevelopmentModelDoc(
    id: json["_id"],
    name: json["name"],
    conceptno: json["conceptno"],
    startDate:
        json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    designer:
        json["designer"] == null ? null : Designer.fromJson(json["designer"]),
    designno: json["designno"],
    goldWt: json["gold_wt"],
    diamondWt: json["diamond_wt"],
    status: json["status"],
    images:
        json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
    remark1: json["remark1"],
    remark2: json["remark2"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    nodesignMade: json["nodesign_made"],
    category:
        json["category"] == null ? null : Category.fromJson(json["category"]),
    style: json["style"] == null ? null : Category.fromJson(json["style"]),
    totalImages: json["totalImages"],
    previewImages:
        json["previewImages"] == null
            ? []
            : List<String>.from(json["previewImages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "conceptno": conceptno,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "designer": designer?.toJson(),
    "designno": designno,
    "gold_wt": goldWt,
    "diamond_wt": diamondWt,
    "status": status,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "remark1": remark1,
    "remark2": remark2,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "nodesign_made": nodesignMade,
    "category": category?.toJson(),
    "style": style?.toJson(),
    "totalImages": totalImages,
    "previewImages":
        previewImages == null
            ? []
            : List<dynamic>.from(previewImages!.map((x) => x)),
  };
}

class Category {
  Category();

  factory Category.fromJson(Map<String, dynamic> json) => Category();

  Map<String, dynamic> toJson() => {};
}

class Designer {
  String? id;
  String? name;

  Designer({this.id, this.name});

  factory Designer.fromJson(Map<String, dynamic> json) =>
      Designer(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
