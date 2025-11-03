import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? message;
  ProfileModelData? data;
  int? status;
  bool? isSuccess;

  ProfileModel({this.message, this.data, this.status, this.isSuccess});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    message: json["Message"],
    data: json["Data"] == null ? null : ProfileModelData.fromJson(json["Data"]),
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

class ProfileModelData {
  ProfileModelUserData? userData;
  PermissionData? permissionData;

  ProfileModelData({this.userData, this.permissionData});

  factory ProfileModelData.fromJson(Map<String, dynamic> json) =>
      ProfileModelData(
        userData:
            json["userData"] == null
                ? null
                : ProfileModelUserData.fromJson(json["userData"]),
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
  List<ProfileModelPermission>? permission;
  bool? status;
  bool? isDeleted;
  List<dynamic>? departmentids;
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
    this.departmentids,
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
            : List<ProfileModelPermission>.from(
              json["permission"]!.map(
                (x) => ProfileModelPermission.fromJson(x),
              ),
            ),
    status: json["status"],
    isDeleted: json["isDeleted"],
    departmentids:
        json["departmentids"] == null
            ? []
            : List<dynamic>.from(json["departmentids"]!.map((x) => x)),
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
    "departmentids":
        departmentids == null
            ? []
            : List<dynamic>.from(departmentids!.map((x) => x)),
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ProfileModelPermission {
  String? collectionname;
  bool? create;
  bool? edit;
  bool? delete;
  bool? view;
  bool? status;
  bool? isglobal;
  bool? isown;
  bool? isassign;
  String? id;

  ProfileModelPermission({
    this.collectionname,
    this.create,
    this.edit,
    this.delete,
    this.view,
    this.status,
    this.isglobal,
    this.isown,
    this.isassign,
    this.id,
  });

  factory ProfileModelPermission.fromJson(Map<String, dynamic> json) =>
      ProfileModelPermission(
        collectionname: json["collectionname"],
        create: json["create"],
        edit: json["edit"],
        delete: json["delete"],
        view: json["view"],
        status: json["status"],
        isglobal: json["isglobal"],
        isown: json["isown"],
        isassign: json["isassign"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
    "collectionname": collectionname,
    "create": create,
    "edit": edit,
    "delete": delete,
    "view": view,
    "status": status,
    "isglobal": isglobal,
    "isown": isown,
    "isassign": isassign,
    "_id": id,
  };
}

class ProfileModelUserData {
  String? id;
  String? code;
  String? name;
  String? email;
  String? countrycode;
  String? mobile;
  String? profilepic;
  bool? isVerified;
  bool? isActive;
  String? roleid;
  String? rolename;
  String? branchid;
  String? branchname;
  bool? status;
  String? availability;
  ProfileModelSalestarget? salestarget;
  dynamic deletedBy;
  dynamic createdBy;
  ProfileModelUpdatedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? channelid;
  DateTime? pswdResetAt;

  ProfileModelUserData({
    this.id,
    this.code,
    this.name,
    this.email,
    this.countrycode,
    this.mobile,
    this.profilepic,
    this.isVerified,
    this.isActive,
    this.roleid,
    this.rolename,
    this.branchid,
    this.branchname,
    this.status,
    this.availability,
    this.salestarget,
    this.deletedBy,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.channelid,
    this.pswdResetAt,
  });

  factory ProfileModelUserData.fromJson(
    Map<String, dynamic> json,
  ) => ProfileModelUserData(
    id: json["_id"],
    code: json["code"],
    name: json["name"],
    email: json["email"],
    countrycode: json["countrycode"],
    mobile: json["mobile"],
    profilepic: json["profilepic"],
    isVerified: json["isVerified"],
    isActive: json["isActive"],
    roleid: json["roleid"],
    rolename: json["rolename"],
    branchid: json["branchid"],
    branchname: json["branchname"],
    status: json["status"],
    availability: json["availability"],
    salestarget:
        json["salestarget"] == null
            ? null
            : ProfileModelSalestarget.fromJson(json["salestarget"]),
    deletedBy: json["deletedBy"],
    createdBy: json["createdBy"],
    updatedBy:
        json["updatedBy"] == null
            ? null
            : ProfileModelUpdatedBy.fromJson(json["updatedBy"]),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    channelid: json["channelid"],
    pswdResetAt:
        json["pswd_reset_at"] == null
            ? null
            : DateTime.parse(json["pswd_reset_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "code": code,
    "name": name,
    "email": email,
    "countrycode": countrycode,
    "mobile": mobile,
    "profilepic": profilepic,
    "isVerified": isVerified,
    "isActive": isActive,
    "roleid": roleid,
    "rolename": rolename,
    "branchid": branchid,
    "branchname": branchname,
    "status": status,
    "availability": availability,
    "salestarget": salestarget?.toJson(),
    "deletedBy": deletedBy,
    "createdBy": createdBy,
    "updatedBy": updatedBy?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "channelid": channelid,
    "pswd_reset_at": pswdResetAt?.toIso8601String(),
  };
}

class ProfileModelSalestarget {
  int? monthlytarget;
  int? currentmonthachieved;

  ProfileModelSalestarget({this.monthlytarget, this.currentmonthachieved});

  factory ProfileModelSalestarget.fromJson(Map<String, dynamic> json) =>
      ProfileModelSalestarget(
        monthlytarget: json["monthlytarget"],
        currentmonthachieved: json["currentmonthachieved"],
      );

  Map<String, dynamic> toJson() => {
    "monthlytarget": monthlytarget,
    "currentmonthachieved": currentmonthachieved,
  };
}

class ProfileModelUpdatedBy {
  String? id;
  String? name;
  String? profilepic;

  ProfileModelUpdatedBy({this.id, this.name, this.profilepic});

  factory ProfileModelUpdatedBy.fromJson(Map<String, dynamic> json) =>
      ProfileModelUpdatedBy(
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
