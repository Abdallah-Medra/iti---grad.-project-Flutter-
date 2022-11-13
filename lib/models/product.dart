import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.id,
    required this.ableToExchange,
    required this.brand,
    required this.categoryId,
    required this.color,
    required this.description,
    required this.durationOfUse,
    required this.firstFilter,
    required this.img,
    required this.offers,
    required this.price,
    required this.secondFilter,
    required this.status,
    required this.thirdFilter,
    required this.time,
    required this.title,
    required this.userId,
  });

  String id;
  String ableToExchange;
  String brand;
  String categoryId;
  String color;
  String description;
  String durationOfUse;
  String firstFilter;
  List<String> img;
  List<String> offers;
  int price;
  String secondFilter;
  String status;
  String thirdFilter;
  String time;
  String title;
  String userId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        ableToExchange: json["ableToExchange"],
        brand: json["brand"],
        categoryId: json["categoryId"],
        color: json["color"],
        description: json["description"],
        durationOfUse: json["durationOfUse"],
        firstFilter: json["firstFilter"],
        img: List<String>.from(json["img"].map((x) => x)),
        offers: List<String>.from(json["offers"].map((x) => x)),
        price: json["price"],
        secondFilter: json["secondFilter"],
        status: json["status"],
        thirdFilter: json["thirdFilter"],
        time: json["time"],
        title: json["title"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ableToExchange": ableToExchange,
        "brand": brand,
        "categoryId": categoryId,
        "color": color,
        "description": description,
        "durationOfUse": durationOfUse,
        "firstFilter": firstFilter,
        "img": List<dynamic>.from(img.map((x) => x)),
        "offers": List<dynamic>.from(offers.map((x) => x)),
        "price": price,
        "secondFilter": secondFilter,
        "status": status,
        "thirdFilter": thirdFilter,
        "time": time,
        "title": title,
        "userId": userId,
      };
}
