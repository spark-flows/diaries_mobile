import 'dart:convert';

GetCategoryModel getCategoryModelFromJson(String str) =>
    GetCategoryModel.fromJson(json.decode(str));

String getCategoryModelToJson(GetCategoryModel data) =>
    json.encode(data.toJson());

class GetCategoryModel {
  String? message;
  GetCategoryData? data;
  int? status;
  bool? isSuccess;

  GetCategoryModel({this.message, this.data, this.status, this.isSuccess});

  factory GetCategoryModel.fromJson(
    Map<String, dynamic> json,
  ) => GetCategoryModel(
    message: json["Message"],
    data: json["Data"] == null ? null : GetCategoryData.fromJson(json["Data"]),
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

class GetCategoryData {
  List<GetCategoryDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  GetCategoryData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory GetCategoryData.fromJson(Map<String, dynamic> json) =>
      GetCategoryData(
        docs:
            json["docs"] == null
                ? []
                : List<GetCategoryDoc>.from(
                  json["docs"]!.map((x) => GetCategoryDoc.fromJson(x)),
                ),
        totalDocs: json["totalDocs"] ?? 0,
        limit: json["limit"] ?? 0,
        totalPages: json["totalPages"] ?? 0,
        page: json["page"] ?? 0,
        pagingCounter: json["pagingCounter"] ?? 0,
        hasPrevPage: json["hasPrevPage"] ?? false,
        hasNextPage: json["hasNextPage"] ?? false,
        prevPage: json["prevPage"] ?? 0,
        nextPage: json["nextPage"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "docs":
        docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class GetCategoryDoc {
  String? id;
  String? name;
  bool? status;
  bool? isDeleted;
  dynamic deletedBy;
  GetCategoryAtedBy? createdBy;
  GetCategoryAtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? docId;

  GetCategoryDoc({
    this.id,
    this.name,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.docId,
  });

  factory GetCategoryDoc.fromJson(Map<String, dynamic> json) => GetCategoryDoc(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    status: json["status"] ?? false,
    isDeleted: json["isDeleted"] ?? false,
    deletedBy: json["deletedBy"] ?? "",
    createdBy:
        json["createdBy"] == null
            ? null
            : GetCategoryAtedBy.fromJson(json["createdBy"]),
    updatedBy:
        json["updatedBy"] == null
            ? null
            : GetCategoryAtedBy.fromJson(json["updatedBy"]),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    docId: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "status": status,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy?.toJson(),
    "updatedBy": updatedBy?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "id": docId,
  };
}

class GetCategoryAtedBy {
  String? id;
  String? name;

  GetCategoryAtedBy({this.id, this.name});

  factory GetCategoryAtedBy.fromJson(Map<String, dynamic> json) =>
      GetCategoryAtedBy(id: json["_id"] ?? "", name: json["name"] ?? "");

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
