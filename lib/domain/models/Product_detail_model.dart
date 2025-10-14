import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  String message;
  ProductDetailData data;
  int status;
  bool isSuccess;

  ProductDetailModel({
    required this.message,
    required this.data,
    required this.status,
    required this.isSuccess,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        message: json["Message"],
        data: ProductDetailData.fromJson(json["Data"]),
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

class ProductDetailData {
  String id;
  String designno;
  String srjobno;
  String collection;
  String inwardno;
  String category;
  String subcategory;
  String size;
  String metaltype;
  String metalcolor;
  double gWt;
  double metalweight;
  double purchasefine;
  int salefine;
  double dCt;
  int diamondpcs;
  int csct;
  int cspcs;
  int miscct;
  int miscpcs;
  String status;
  String invoiceno;
  String customer;
  double price;
  String location;
  String huid;
  String producttype;
  String certificateno;
  DateTime createdAt;
  DateTime updatedAt;
       int quantity;


  ProductDetailData({
    required this.id,
    required this.designno,
    required this.srjobno,
    required this.collection,
    required this.inwardno,
    required this.category,
    required this.subcategory,
    required this.size,
    required this.metaltype,
    required this.metalcolor,
    required this.gWt,
    required this.metalweight,
    required this.purchasefine,
    required this.salefine,
    required this.dCt,
    required this.diamondpcs,
    required this.csct,
    required this.cspcs,
    required this.miscct,
    required this.miscpcs,
    required this.status,
    required this.invoiceno,
    required this.customer,
    required this.price,
    required this.location,
    required this.huid,
    required this.producttype,
    required this.certificateno,
    required this.createdAt,
    required this.updatedAt,
this.quantity = 1,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      ProductDetailData(
        id: json["_id"],
        designno: json["designno"],
        srjobno: json["srjobno"],
        collection: json["collection"],
        inwardno: json["inwardno"],
        category: json["category"],
        subcategory: json["subcategory"],
        size: json["size"],
        metaltype: json["metaltype"],
        metalcolor: json["metalcolor"],
        gWt: json["g_wt"]?.toDouble(),
        metalweight: json["metalweight"]?.toDouble(),
        purchasefine: json["purchasefine"]?.toDouble(),
        salefine: json["salefine"],
        dCt: json["d_ct"]?.toDouble(),
        diamondpcs: json["diamondpcs"],
        csct: json["csct"],
        cspcs: json["cspcs"],
        miscct: json["miscct"],
        miscpcs: json["miscpcs"],
        status: json["status"],
        invoiceno: json["invoiceno"],
        customer: json["customer"],
        price: json["price"]?.toDouble(),
        location: json["location"],
        huid: json["huid"],
        producttype: json["producttype"],
        certificateno: json["certificateno"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
     quantity: json["quantity"] ?? 1,
        );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "designno": designno,
    "srjobno": srjobno,
    "collection": collection,
    "inwardno": inwardno,
    "category": category,
    "subcategory": subcategory,
    "size": size,
    "metaltype": metaltype,
    "metalcolor": metalcolor,
    "g_wt": gWt,
    "metalweight": metalweight,
    "purchasefine": purchasefine,
    "salefine": salefine,
    "d_ct": dCt,
    "diamondpcs": diamondpcs,
    "csct": csct,
    "cspcs": cspcs,
    "miscct": miscct,
    "miscpcs": miscpcs,
    "status": status,
    "invoiceno": invoiceno,
    "customer": customer,
    "price": price,
    "location": location,
    "huid": huid,
    "producttype": producttype,
    "certificateno": certificateno,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  "quantity": quantity,
  };

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'designno': designno,
      'srjobno': srjobno,
      'collection': collection,
      'inwardno': inwardno,
      'category': category,
      'subcategory': subcategory,
      'size': size,
      'metaltype': metaltype,
      'metalcolor': metalcolor,
      'gWt': gWt,
      'metalweight': metalweight,
      'purchasefine': purchasefine,
      'salefine': salefine,
      'dCt': dCt,
      'diamondpcs': diamondpcs,
      'csct': csct,
      'cspcs': cspcs,
      'miscct': miscct,
      'miscpcs': miscpcs,
      'status': status,
      'invoiceno': invoiceno,
      'customer': customer,
      'price': price,
      'location': location,
      'huid': huid,
      'producttype': producttype,
      'certificateno': certificateno,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      "quantity": quantity,
      };
  }

  factory ProductDetailData.fromMap(Map<String, dynamic> map) {
    return ProductDetailData(
      id: map['id'],
      designno: map['designno'],
      srjobno: map['srjobno'],
      collection: map['collection'],
      inwardno: map['inwardno'],
      category: map['category'],
      subcategory: map['subcategory'],
      size: map['size'],
      metaltype: map['metaltype'],
      metalcolor: map['metalcolor'],
      gWt: (map['gWt'] ?? 0).toDouble(),
      metalweight: (map['metalweight'] ?? 0).toDouble(),
      purchasefine: (map['purchasefine'] ?? 0).toDouble(),
      salefine: map['salefine'] ?? 0,
      dCt: (map['dCt'] ?? 0).toDouble(),
      diamondpcs: map['diamondpcs'] ?? 0,
      csct: map['csct'] ?? 0,
      cspcs: map['cspcs'] ?? 0,
      miscct: map['miscct'] ?? 0,
      miscpcs: map['miscpcs'] ?? 0,
      status: map['status'],
      invoiceno: map['invoiceno'],
      customer: map['customer'],
      price: (map['price'] ?? 0).toDouble(),
      location: map['location'],
      huid: map['huid'],
      producttype: map['producttype'],
      certificateno: map['certificateno'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    quantity: map["quantity"] ?? 1,
    );
  }

  ProductDetailData copyWith({
    String? id,
    String? designno,
    String? srjobno,
    String? collection,
    String? inwardno,
    String? category,
    String? subcategory,
    String? size,
    String? metaltype,
    String? metalcolor,
    double? gWt,
    double? metalweight,
    double? purchasefine,
    int? salefine,
    double? dCt,
    int? diamondpcs,
    int? csct,
    int? cspcs,
    int? miscct,
    int? miscpcs,
    String? status,
    String? invoiceno,
    String? customer,
    double? price,
    String? location,
    String? huid,
    String? producttype,
    String? certificateno,
    DateTime? createdAt,
    DateTime? updatedAt,

    int? quantity,
  }) {
    return ProductDetailData(
      id: id ?? this.id,
      designno: designno ?? this.designno,
      srjobno: srjobno ?? this.srjobno,
      collection: collection ?? this.collection,
      inwardno: inwardno ?? this.inwardno,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      size: size ?? this.size,
      metaltype: metaltype ?? this.metaltype,
      metalcolor: metalcolor ?? this.metalcolor,
      gWt: gWt ?? this.gWt,
      metalweight: metalweight ?? this.metalweight,
      purchasefine: purchasefine ?? this.purchasefine,
      salefine: salefine ?? this.salefine,
      dCt: dCt ?? this.dCt,
      diamondpcs: diamondpcs ?? this.diamondpcs,
      csct: csct ?? this.csct,
      cspcs: cspcs ?? this.cspcs,
      miscct: miscct ?? this.miscct,
      miscpcs: miscpcs ?? this.miscpcs,
      status: status ?? this.status,
      invoiceno: invoiceno ?? this.invoiceno,
      customer: customer ?? this.customer,
      price: price ?? this.price,
      location: location ?? this.location,
      huid: huid ?? this.huid,
      producttype: producttype ?? this.producttype,
      certificateno: certificateno ?? this.certificateno,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    quantity: quantity ?? this.quantity,
    );
  }
}
