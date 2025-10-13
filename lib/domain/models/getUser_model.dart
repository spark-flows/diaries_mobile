import 'dart:convert';

PostCreateUser postCreateUserFromJson(String str) => PostCreateUser.fromJson(json.decode(str));

String postCreateUserToJson(PostCreateUser data) => json.encode(data.toJson());

class PostCreateUser {
    final String message;
    final PostCreateUserData data;
    final int status;
    final bool isSuccess;

    PostCreateUser({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    factory PostCreateUser.fromJson(Map<String, dynamic> json) => PostCreateUser(
        message: json["Message"],
        data: PostCreateUserData.fromJson(json["Data"]),
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

class PostCreateUserData {
    final String name;
    final String mobile;
    final String email;
    final String address;
    final String state;
    final String city;
    final String area;
    final String zipcode;
    final bool status;
    final bool isDeleted;
    final String deletedBy;
    final String createdBy;
    final String updatedBy;
    final String code;
    final String id;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    PostCreateUserData({
        required this.name,
        required this.mobile,
        required this.email,
        required this.address,
        required this.state,
        required this.city,
        required this.area,
        required this.zipcode,
        required this.status,
        required this.isDeleted,
        required this.deletedBy,
        required this.createdBy,
        required this.updatedBy,
        required this.code,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory PostCreateUserData.fromJson(Map<String, dynamic> json) => PostCreateUserData(
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        state: json["state"],
        city: json["city"],
        area: json["area"],
        zipcode: json["zipcode"],
        status: json["status"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        code: json["code"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "address": address,
        "state": state,
        "city": city,
        "area": area,
        "zipcode": zipcode,
        "status": status,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "code": code,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,  
    };
}
