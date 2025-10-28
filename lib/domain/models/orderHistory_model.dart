import 'dart:convert';

CustomerOrderHistory customerOrderHistoryFromJson(String str) =>
    CustomerOrderHistory.fromJson(json.decode(str));

String customerOrderHistoryToJson(CustomerOrderHistory data) =>
    json.encode(data.toJson());

class CustomerOrderHistory {
  final String message;
  final CustomerOrderHistoryData data;
  final int status;
  final bool isSuccess;

  CustomerOrderHistory({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  CustomerOrderHistory copyWith({
    String? message,
    CustomerOrderHistoryData? data,
    int? status,
    bool? isSuccess,
  }) => CustomerOrderHistory(
    message: message ?? this.message,
    data: data ?? this.data,
    status: status ?? this.status,
    isSuccess: isSuccess ?? this.isSuccess,
  );

  factory CustomerOrderHistory.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistory(
        message: json["Message"],
        data: CustomerOrderHistoryData.fromJson(json["Data"]),
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

class CustomerOrderHistoryData {
  final List<CustomerOrderHistoryDoc> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int totalQty;
  final double totalPrice;
  final double totalFinalPrice;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final dynamic prevPage;
  final dynamic nextPage;

  CustomerOrderHistoryData({
    required this.docs,
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.totalQty,
    required this.totalPrice,
    required this.totalFinalPrice,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.prevPage,
    required this.nextPage,
  });

  CustomerOrderHistoryData copyWith({
    List<CustomerOrderHistoryDoc>? docs,
    int? totalDocs,
    int? limit,
    int? totalPages,
    int? page,
    int? totalQty,
    double? totalPrice,
    double? totalFinalPrice,
    int? pagingCounter,
    bool? hasPrevPage,
    bool? hasNextPage,
    dynamic prevPage,
    dynamic nextPage,
  }) => CustomerOrderHistoryData(
    docs: docs ?? this.docs,
    totalDocs: totalDocs ?? this.totalDocs,
    limit: limit ?? this.limit,
    totalPages: totalPages ?? this.totalPages,
    page: page ?? this.page,
    totalQty: totalQty ?? this.totalQty,
    totalPrice: totalPrice ?? this.totalPrice,
    totalFinalPrice: totalFinalPrice ?? this.totalFinalPrice,
    pagingCounter: pagingCounter ?? this.pagingCounter,
    hasPrevPage: hasPrevPage ?? this.hasPrevPage,
    hasNextPage: hasNextPage ?? this.hasNextPage,
    prevPage: prevPage ?? this.prevPage,
    nextPage: nextPage ?? this.nextPage,
  );

  factory CustomerOrderHistoryData.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistoryData(
        docs: List<CustomerOrderHistoryDoc>.from(json["docs"].map((x) => CustomerOrderHistoryDoc.fromJson(x))),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        totalQty: json["totalQty"],
        totalPrice: json["totalPrice"]?.toDouble(),
        totalFinalPrice: json["totalFinalPrice"]?.toDouble(),
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "totalQty": totalQty,
    "totalPrice": totalPrice,
    "totalFinalPrice": totalFinalPrice,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class CustomerOrderHistoryDoc {
  final String id;
  final double totalAmount;
  final int discount;
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

  CustomerOrderHistoryDoc copyWith({
    String? id,
    double? totalAmount,
    int? discount,
    double? finalAmount,
    String? status,
    CustomerOrderHistoryCustomer? customer,
    CustomerOrderHistorySalesman? salesman,
    List<CustomerOrderHistoryProduct>? products,
    int? qty,
    DateTime? orderDate,
    String? orderNo,
  }) => CustomerOrderHistoryDoc(
    id: id ?? this.id,
    totalAmount: totalAmount ?? this.totalAmount,
    discount: discount ?? this.discount,
    finalAmount: finalAmount ?? this.finalAmount,
    status: status ?? this.status,
    customer: customer ?? this.customer,
    salesman: salesman ?? this.salesman,
    products: products ?? this.products,
    qty: qty ?? this.qty,
    orderDate: orderDate ?? this.orderDate,
    orderNo: orderNo ?? this.orderNo,
  );

  factory CustomerOrderHistoryDoc.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistoryDoc(
        id: json["_id"],
        totalAmount: json["totalAmount"]?.toDouble(),
        discount: json["discount"],
        finalAmount: json["finalAmount"]?.toDouble(),
        status: json["status"],
        customer: CustomerOrderHistoryCustomer.fromJson(json["customer"]),
        salesman: CustomerOrderHistorySalesman.fromJson(json["salesman"]),
        products: List<CustomerOrderHistoryProduct>.from(
          json["products"].map((x) => CustomerOrderHistoryProduct.fromJson(x)),
        ),
        qty: json["qty"],
        orderDate: DateTime.parse(json["orderDate"]),
        orderNo: json["orderNo"],
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

  CustomerOrderHistoryCustomer copyWith({
    String? id,
    String? name,
    String? mobile,
    String? email,
    String? address,
    String? city,
    String? area,
    String? zipcode,
  }) => CustomerOrderHistoryCustomer(
    id: id ?? this.id,
    name: name ?? this.name,
    mobile: mobile ?? this.mobile,
    email: email ?? this.email,
    address: address ?? this.address,
    city: city ?? this.city,
    area: area ?? this.area,
    zipcode: zipcode ?? this.zipcode,
  );

  factory CustomerOrderHistoryCustomer.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistoryCustomer(
        id: json["_id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        city: json["city"],
        area: json["area"],
        zipcode: json["zipcode"],
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

  CustomerOrderHistoryProduct copyWith({
    String? srjobno,
    String? designno,
    String? metaltype,
    double? metalwt,
    double? price,
    int? qty,
    double? itemTotal,
  }) => CustomerOrderHistoryProduct(
    srjobno: srjobno ?? this.srjobno,
    designno: designno ?? this.designno,
    metaltype: metaltype ?? this.metaltype,
    metalwt: metalwt ?? this.metalwt,
    price: price ?? this.price,
    qty: qty ?? this.qty,
    itemTotal: itemTotal ?? this.itemTotal,
  );

  factory CustomerOrderHistoryProduct.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistoryProduct(
        srjobno: json["srjobno"],
        designno: json["designno"],
        metaltype: json["metaltype"],
        metalwt: json["metalwt"]?.toDouble(),
        price: json["price"]?.toDouble(),
        qty: json["qty"],
        itemTotal: json["itemTotal"]?.toDouble(),
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

  CustomerOrderHistorySalesman copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
  }) => CustomerOrderHistorySalesman(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    mobile: mobile ?? this.mobile,
  );

  factory CustomerOrderHistorySalesman.fromJson(Map<String, dynamic> json) =>
      CustomerOrderHistorySalesman(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
  };
}
