// To parse this JSON data, do
//
//     final cartProductUpdate = cartProductUpdateFromJson(jsonString);

import 'dart:convert';

CartProductUpdate cartProductUpdateFromJson(String str) => CartProductUpdate.fromJson(json.decode(str));

String cartProductUpdateToJson(CartProductUpdate data) => json.encode(data.toJson());

class CartProductUpdate {
    final String message;
    final Data data;
    final int status;
    final bool isSuccess;

    CartProductUpdate({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    CartProductUpdate copyWith({
        String? message,
        Data? data,
        int? status,
        bool? isSuccess,
    }) => 
        CartProductUpdate(
            message: message ?? this.message,
            data: data ?? this.data,
            status: status ?? this.status,
            isSuccess: isSuccess ?? this.isSuccess,
        );

    factory CartProductUpdate.fromJson(Map<String, dynamic> json) => CartProductUpdate(
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
    final String id;
    final List<Item> items;
    final String customerid;
    final double totalAmount;
    final int discount;
    final double finalAmount;
    final String status;
    final bool isDeleted;
    final String deletedBy;
    final String createdBy;
    final String updatedBy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    Data({
        required this.id,
        required this.items,
        required this.customerid,
        required this.totalAmount,
        required this.discount,
        required this.finalAmount,
        required this.status,
        required this.isDeleted,
        required this.deletedBy,
        required this.createdBy,
        required this.updatedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    Data copyWith({
        String? id,
        List<Item>? items,
        String? customerid,
        double? totalAmount,
        int? discount,
        double? finalAmount,
        String? status,
        bool? isDeleted,
        String? deletedBy,
        String? createdBy,
        String? updatedBy,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        Data(
            id: id ?? this.id,
            items: items ?? this.items,
            customerid: customerid ?? this.customerid,
            totalAmount: totalAmount ?? this.totalAmount,
            discount: discount ?? this.discount,
            finalAmount: finalAmount ?? this.finalAmount,
            status: status ?? this.status,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            createdBy: createdBy ?? this.createdBy,
            updatedBy: updatedBy ?? this.updatedBy,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"] ?? '',
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        customerid: json["customerid"] ?? '',
        totalAmount: json["totalAmount"]?.toDouble() ?? 0.0,
        discount: json["discount"] ?? 0,
        finalAmount: json["finalAmount"]?.toDouble() ?? 0.0,
        status: json["status"] ?? '',
        isDeleted: json["isDeleted"] ?? false,
        deletedBy: json["deletedBy"] ?? '',
        createdBy: json["createdBy"] ?? '',
        updatedBy: json["updatedBy"] ?? '',
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "customerid": customerid,
        "totalAmount": totalAmount,
        "discount": discount,
        "finalAmount": finalAmount,
        "status": status,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Item {
    final String productid;
    final int quantity;
    final double itemTotal;
    final String id;

    Item({
        required this.productid,
        required this.quantity,
        required this.itemTotal,
        required this.id,
    });

    Item copyWith({
        String? productid,
        int? quantity,
        double? itemTotal,
        String? id,
    }) => 
        Item(
            productid: productid ?? this.productid,
            quantity: quantity ?? this.quantity,
            itemTotal: itemTotal ?? this.itemTotal,
            id: id ?? this.id,
        );

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productid: json["productid"] ?? '',
        quantity: json["quantity"] ?? 0,
        itemTotal: json["itemTotal"]?.toDouble() ?? 0.0,
        id: json["_id"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "productid": productid,
        "quantity": quantity,
        "itemTotal": itemTotal,
        "_id": id,
    };
}
