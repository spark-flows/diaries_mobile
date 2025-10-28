// To parse this JSON data, use:
// final customerOrderHistory = CustomerOrderHistory.fromJson(jsonString);

import 'dart:convert';

CustomerOrderHistory customerOrderHistoryFromJson(String str) =>
    CustomerOrderHistory.fromJson(json.decode(str));

String customerOrderHistoryToJson(CustomerOrderHistory data) =>
    json.encode(data.toJson());

class CustomerOrderHistory {
  final bool success;
  final List<CustomerOrderHistoryDoc> data;
  final int statusCode;
  final String message;

  CustomerOrderHistory({
    required this.success,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory CustomerOrderHistory.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistory(
        success: json["success"] ?? false,
        data:
            json["data"] != null && json["data"] is List
                ? List<CustomerOrderHistoryDoc>.from(
                  json["data"].map((x) => CustomerOrderHistoryDoc.fromJson(x)),
                )
                : [],
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "statusCode": statusCode,
    "message": message,
  };
}

class CustomerOrderHistoryDoc {
  final String id;
  final double totalAmount;
  final double discount;
  final double finalAmount;
  final String status;
  final CustomerOrderHistoryCustomer customer;
  final CustomerOrderHistorySalesman salesman;
  final List<CustomerOrderHistoryProduct> products;
  final int qty;
  final DateTime orderDate;
  final String orderNo;

  CustomerOrderHistoryDoc({
    required this.id,
    required this.totalAmount,
    required this.discount,
    required this.finalAmount,
    required this.status,
    required this.customer,
    required this.salesman,
    required this.products,
    required this.qty,
    required this.orderDate,
    required this.orderNo,
  });

  factory CustomerOrderHistoryDoc.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistoryDoc(
        id: json["_id"] ?? '',
        totalAmount: json["totalAmount"] ?? 0.0,
        discount: json["discount"] ?? 0.0,
        finalAmount: json["finalAmount"] ?? 0.0,
        status: json["status"] ?? '',
        customer:
            json["customer"] != null
                ? CustomerOrderHistoryCustomer.fromJson(json["customer"])
                : CustomerOrderHistoryCustomer.empty(),
        salesman:
            json["salesman"] != null
                ? CustomerOrderHistorySalesman.fromJson(json["salesman"])
                : CustomerOrderHistorySalesman.empty(),
        products:
            (json["products"] is List)
                ? List<CustomerOrderHistoryProduct>.from(
                  json["products"].map(
                    (x) => CustomerOrderHistoryProduct.fromJson(x),
                  ),
                )
                : [],
        qty: json["qty"] ?? 0,
        orderDate:
            json["orderDate"] != null
                ? DateTime.tryParse(json["orderDate"]) ?? DateTime.now()
                : DateTime.now(),
        orderNo: json["orderNo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "totalAmount": totalAmount,
    "discount": discount,
    "finalAmount": finalAmount,
    "status": status,
    "customer": customer.toJson(),
    "salesman": salesman.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "qty": qty,
    "orderDate": orderDate.toIso8601String(),
    "orderNo": orderNo,
  };
}

class CustomerOrderHistoryCustomer {
  final String id;
  final String name;
  final String mobile;
  final String email;
  final String address;
  final String city;
  final String area;
  final String zipcode;

  CustomerOrderHistoryCustomer({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.address,
    required this.city,
    required this.area,
    required this.zipcode,
  });

  factory CustomerOrderHistoryCustomer.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistoryCustomer(
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        mobile: json["mobile"] ?? '',
        email: json["email"] ?? '',
        address: json["address"] ?? '',
        city: json["city"] ?? '',
        area: json["area"] ?? '',
        zipcode: json["zipcode"] ?? '',
      );

  factory CustomerOrderHistoryCustomer.empty() => CustomerOrderHistoryCustomer(
    id: '',
    name: '',
    mobile: '',
    email: '',
    address: '',
    city: '',
    area: '',
    zipcode: '',
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "address": address,
    "city": city,
    "area": area,
    "zipcode": zipcode,
  };
}

class CustomerOrderHistorySalesman {
  final String id;
  final String name;
  final String email;
  final String mobile;

  CustomerOrderHistorySalesman({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory CustomerOrderHistorySalesman.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistorySalesman(
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        mobile: json["mobile"] ?? '',
      );

  factory CustomerOrderHistorySalesman.empty() =>
      CustomerOrderHistorySalesman(id: '', name: '', email: '', mobile: '');

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
  };
}

class CustomerOrderHistoryProduct {
  final String srjobno;
  final String designno;
  final String metaltype;
  final double metalwt;
  final double price;
  final int qty;
  final double itemTotal;

  CustomerOrderHistoryProduct({
    required this.srjobno,
    required this.designno,
    required this.metaltype,
    required this.metalwt,
    required this.price,
    required this.qty,
    required this.itemTotal,
  });

  factory CustomerOrderHistoryProduct.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistoryProduct(
        srjobno: json["srjobno"] ?? '',
        designno: json["designno"] ?? '',
        metaltype: json["metaltype"] ?? '',
        metalwt: json["metalwt"] ?? 0.0,
        price: json["price"] ?? 0.0,
        qty: json["qty"] ?? 0,
        itemTotal: json["itemTotal"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
    "srjobno": srjobno,
    "designno": designno,
    "metaltype": metaltype,
    "metalwt": metalwt,
    "price": price,
    "qty": qty,
    "itemTotal": itemTotal,
  };
}
