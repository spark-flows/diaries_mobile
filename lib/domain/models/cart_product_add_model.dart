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
    final String productid;
    final String customerid;
    final int totalAmount;
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
    final List<Item> items;

    Data({
        required this.id,
        required this.productid,
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
        required this.items,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        productid: json["productid"],
        customerid: json["customerid"],
        totalAmount: json["totalAmount"],
        discount: json["discount"],
        finalAmount: json["finalAmount"]?.toDouble(),
        status: json["status"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productid": productid,
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
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    final String productid;
    final int quantity;
    final int itemTotal;
    final String id;

    Item({
        required this.productid,
        required this.quantity,
        required this.itemTotal,
        required this.id,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productid: json["productid"],
        quantity: json["quantity"],
        itemTotal: json["itemTotal"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "productid": productid,
        "quantity": quantity,
        "itemTotal": itemTotal,
        "_id": id,
    };
}
