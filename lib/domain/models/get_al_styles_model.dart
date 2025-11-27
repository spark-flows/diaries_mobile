import 'dart:convert';

GetStyleModel getStyleModelFromJson(String str) =>
    GetStyleModel.fromJson(json.decode(str));

String getStyleModelToJson(GetStyleModel data) => json.encode(data.toJson());

class GetStyleModel {
  String? message;
  GetStyleData? data;
  int? status;
  bool? isSuccess;

  GetStyleModel({this.message, this.data, this.status, this.isSuccess});

  factory GetStyleModel.fromJson(Map<String, dynamic> json) => GetStyleModel(
    message: json["Message"],
    data: json["Data"] == null ? null : GetStyleData.fromJson(json["Data"]),
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

class GetStyleData {
  List<GetStyleDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  GetStyleData({
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

  factory GetStyleData.fromJson(Map<String, dynamic> json) => GetStyleData(
    docs:
        json["docs"] == null
            ? []
            : List<GetStyleDoc>.from(
              json["docs"]!.map((x) => GetStyleDoc.fromJson(x)),
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

class GetStyleDoc {
  String? id;
  String? name;
  bool? status;
  bool? isDeleted;
  dynamic deletedBy;
  GetStyleAtedBy? createdBy;
  GetStyleAtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? docId;

  GetStyleDoc({
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

  factory GetStyleDoc.fromJson(Map<String, dynamic> json) => GetStyleDoc(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    status: json["status"] ?? false,
    isDeleted: json["isDeleted"] ?? false,
    deletedBy: json["deletedBy"] ?? "",
    createdBy:
        json["createdBy"] == null
            ? null
            : GetStyleAtedBy.fromJson(json["createdBy"]),
    updatedBy:
        json["updatedBy"] == null
            ? null
            : GetStyleAtedBy.fromJson(json["updatedBy"]),
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

class GetStyleAtedBy {
  String? id;
  String? name;

  GetStyleAtedBy({this.id, this.name});

  factory GetStyleAtedBy.fromJson(Map<String, dynamic> json) =>
      GetStyleAtedBy(id: json["_id"] ?? "", name: json["name"] ?? "");

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
