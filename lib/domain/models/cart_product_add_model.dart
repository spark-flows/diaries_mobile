// To parse this JSON data, do
//
//     final cartProductUpdate = cartProductUpdateFromJson(jsonString);

import 'dart:convert';


CartProductUpdate cartProductUpdateFromJson(String str) => CartProductUpdate.fromJson(json.decode(str));

String cartProductUpdateToJson(CartProductUpdate data) => json.encode(data.toJson());

class CartProductUpdate {
  final String message;
  final CartProductData data;
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
    CartProductData? data,
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
    data: CartProductData.fromJson(json["Data"]),
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

class CartProductData {
  final String orderid;
  final String customerid;
  final String userid;
  final List<CartProduct> products;
  final String total;
  final String discount;
  final String finalAmount;
  final String status;

  CartProductData({
    required this.orderid,
    required this.customerid,
    required this.userid,
    required this.products,
    required this.total,
    required this.discount,
    required this.finalAmount,
    required this.status,
  });

  CartProductData copyWith({
    String? orderid,
    String? customerid,
    String? userid,
    List<CartProduct>? products,
    String? total,
    String? discount,
    String? finalAmount,
    String? status,
  }) =>
      CartProductData(
        orderid: orderid ?? this.orderid,
        customerid: customerid ?? this.customerid,
        userid: userid ?? this.userid,
        products: products ?? this.products,
        total: total ?? this.total,
        discount: discount ?? this.discount,
        finalAmount: finalAmount ?? this.finalAmount,
        status: status ?? this.status,
      );

  factory CartProductData.fromJson(Map<String, dynamic> json) => CartProductData(
    orderid: json["orderid"],
    customerid: json["customerid"],
    userid: json["userid"],
    products: List<CartProduct>.from(json["products"].map((x) => CartProduct.fromJson(x))),
    total: json["total"],
    discount: json["discount"],
    finalAmount: json["finalAmount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "orderid": orderid,
    "customerid": customerid,
    "userid": userid,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "discount": discount,
    "finalAmount": finalAmount,
    "status": status,
  };
}

class CartProduct {
  final String productid;
  final int qty;
  final String total;

  CartProduct({
    required this.productid,
    required this.qty,
    required this.total,
  });

  CartProduct copyWith({
    String? productid,
    int? qty,
    String? total,
  }) =>
      CartProduct(
        productid: productid ?? this.productid,
        qty: qty ?? this.qty,
        total: total ?? this.total,
      );

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    productid: json["productid"],
    qty: json["qty"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "qty": qty,
    "total": total,
  };
}
