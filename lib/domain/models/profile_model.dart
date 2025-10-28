import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? message;
  ProfileData? data;
  int? status;
  bool? isSuccess;

  ProfileModel({this.message, this.data, this.status, this.isSuccess});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    message: json["Message"],
    data: json["Data"] == null ? null : ProfileData.fromJson(json["Data"]),
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

class ProfileData {
  UserData? userData;
  PermissionData? permissionData;

  ProfileData({this.userData, this.permissionData});

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    userData:
        json["userData"] == null ? null : UserData.fromJson(json["userData"]),
    permissionData:
        json["permissionData"] == null
            ? null
            : PermissionData.fromJson(json["permissionData"]),
  );

  Map<String, dynamic> toJson() => {
    "userData": userData?.toJson(),
    "permissionData": permissionData?.toJson(),
  };
}

class PermissionData {
  String? id;
  String? rolename;
  List<ProfilePermission>? permission;
  bool? status;
  bool? isDeleted;
  String? deletedBy;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PermissionData({
    this.id,
    this.rolename,
    this.permission,
    this.status,
    this.isDeleted,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PermissionData.fromJson(Map<String, dynamic> json) => PermissionData(
    id: json["_id"],
    rolename: json["rolename"],
    permission:
        json["permission"] == null
            ? []
            : List<ProfilePermission>.from(
              json["permission"]!.map((x) => ProfilePermission.fromJson(x)),
            ),
    status: json["status"],
    isDeleted: json["isDeleted"],
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rolename": rolename,
    "permission":
        permission == null
            ? []
            : List<dynamic>.from(permission!.map((x) => x.toJson())),
    "status": status,
    "isDeleted": isDeleted,
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ProfilePermission {
  String? collectionname;
  bool? all;
  bool? create;
  bool? edit;
  bool? delete;
  bool? view;
  bool? globalview;
  bool? isglobal;
  bool? isown;
  bool? isassign;
  bool? isbranch;
  String? id;

  ProfilePermission({
    this.collectionname,
    this.all,
    this.create,
    this.edit,
    this.delete,
    this.view,
    this.globalview,
    this.isglobal,
    this.isown,
    this.isassign,
    this.isbranch,
    this.id,
  });

  factory ProfilePermission.fromJson(Map<String, dynamic> json) =>
      ProfilePermission(
        collectionname: json["collectionname"],
        all: json["all"],
        create: json["create"],
        edit: json["edit"],
        delete: json["delete"],
        view: json["view"],
        globalview: json["globalview"],
        isglobal: json["isglobal"],
        isown: json["isown"],
        isassign: json["isassign"],
        isbranch: json["isbranch"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
    "collectionname": collectionname,
    "all": all,
    "create": create,
    "edit": edit,
    "delete": delete,
    "view": view,
    "globalview": globalview,
    "isglobal": isglobal,
    "isown": isown,
    "isassign": isassign,
    "isbranch": isbranch,
    "_id": id,
  };
}

class UserData {
  String? id;
  String? code;
  String? name;
  String? email;
  String? mobile;
  String? profilepic;
  bool? isVerified;
  bool? isActive;
  ProfileRoleid? roleid;
  Branchid? branchid;
  bool? status;
  String? availability;
  dynamic deletedBy;
  CreatedBy? createdBy;
  dynamic updatedBy;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? channelid;

  UserData({
    this.id,
    this.code,
    this.name,
    this.email,
    this.mobile,
    this.profilepic,
    this.isVerified,
    this.isActive,
    this.roleid,
    this.branchid,
    this.status,
    this.availability,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.channelid,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    code: json["code"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    profilepic: json["profilepic"],
    isVerified: json["isVerified"],
    isActive: json["isActive"],
    roleid: json["roleid"] == null ? null : ProfileRoleid.fromJson(json["roleid"]),
    branchid:
        json["branchid"] == null ? null : Branchid.fromJson(json["branchid"]),
    status: json["status"],
    availability: json["availability"],
    deletedBy: json["deletedBy"],
    createdBy:
        json["createdBy"] == null
            ? null
            : CreatedBy.fromJson(json["createdBy"]),
    updatedBy: json["updatedBy"],
    address: json["address"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    channelid: json["channelid"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "code": code,
    "name": name,
    "email": email,
    "mobile": mobile,
    "profilepic": profilepic,
    "isVerified": isVerified,
    "isActive": isActive,
    "roleid": roleid,
    "branchid": branchid?.toJson(),
    "status": status,
    "availability": availability,
    "deletedBy": deletedBy,
    "createdBy": createdBy?.toJson(),
    "updatedBy": updatedBy,
    "address": address,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "channelid": channelid,
  };
}

class Branchid {
  String? id;
  String? name;
  String? location;

  Branchid({this.id, this.name, this.location});

  factory Branchid.fromJson(Map<String, dynamic> json) =>
      Branchid(id: json["_id"], name: json["name"], location: json["location"]);

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "location": location,
  };
}

class CreatedBy {
  String? id;
  String? name;
  String? profilepic;

  CreatedBy({this.id, this.name, this.profilepic});

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["_id"],
    name: json["name"],
    profilepic: json["profilepic"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "profilepic": profilepic,
  };
}

class ProfileRoleid {
  String? id;
  String? rolename;

  ProfileRoleid({this.id, this.rolename});

  factory ProfileRoleid.fromJson(Map<String, dynamic> json) =>
      ProfileRoleid(id: json["_id"], rolename: json["rolename"]);

  Map<String, dynamic> toJson() => {"_id": id, "rolename": rolename};
}
