import 'dart:convert';

GetAllUserListModel getAllUserListModelFromJson(String str) =>
    GetAllUserListModel.fromJson(json.decode(str));

String getAllUserListModelToJson(GetAllUserListModel data) =>
    json.encode(data.toJson());

class GetAllUserListModel {
  String? message;
  GetAllUserListData? data;
  int? status;
  bool? isSuccess;

  GetAllUserListModel({this.message, this.data, this.status, this.isSuccess});

  factory GetAllUserListModel.fromJson(Map<String, dynamic> json) =>
      GetAllUserListModel(
        message: json["Message"],
        data:
            json["Data"] == null
                ? null
                : GetAllUserListData.fromJson(json["Data"]),
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

class GetAllUserListData {
  List<GetAllUserListDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  GetAllUserListData({
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

  factory GetAllUserListData.fromJson(Map<String, dynamic> json) =>
      GetAllUserListData(
        docs:
            json["docs"] == null
                ? []
                : List<GetAllUserListDoc>.from(
                  json["docs"]!.map((x) => GetAllUserListDoc.fromJson(x)),
                ),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
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
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class GetAllUserListDoc {
  String? id;
  String? code;
  String? name;
  String? email;
  String? mobile;
  String? roleid;
  String? rolename;
  bool? status;
  bool? isDeleted;
  dynamic deletedBy;
  GetAllUserListAtedBy? createdBy;
  GetAllUserListAtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? docId;

  GetAllUserListDoc({
    this.id,
    this.code,
    this.name,
    this.email,
    this.mobile,
    this.roleid,
    this.rolename,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.docId,
  });

  factory GetAllUserListDoc.fromJson(
    Map<String, dynamic> json,
  ) => GetAllUserListDoc(
    id: json["_id"],
    code: json["code"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    roleid: json["roleid"],
    rolename: json["rolename"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy:
        json["createdBy"] == null ? null : GetAllUserListAtedBy.fromJson(json["createdBy"]),
    updatedBy:
        json["updatedBy"] == null ? null : GetAllUserListAtedBy.fromJson(json["updatedBy"]),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    docId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "code": code,
    "name": name,
    "email": email,
    "mobile": mobile,
    "roleid": roleid,
    "rolename": rolename,
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

class GetAllUserListAtedBy {
  String? id;
  String? name;

  GetAllUserListAtedBy({this.id, this.name});

  factory GetAllUserListAtedBy.fromJson(Map<String, dynamic> json) =>
      GetAllUserListAtedBy(id: json["_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
