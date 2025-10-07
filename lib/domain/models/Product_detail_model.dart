import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

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

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
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
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
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
  };
}
