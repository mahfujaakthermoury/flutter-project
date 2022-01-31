import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.img5,
    required this.price,
    required this.sellingPrice,
    required this.description,
  });

  int id;
  String categoryId;
  String name;
  String img1;
  String img2;
  String img3;
  dynamic img4;
  dynamic img5;
  String price;
  String sellingPrice;
  String description;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    img1: json["img1"],
    img2: json["img2"] == null ? '' : json["img2"],
    img3: json["img3"] == null ? '' : json["img3"],
    img4: json["img4"],
    img5: json["img5"],
    price: json["price"],
    sellingPrice: json["selling_price"] == null ? '' : json["selling_price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "img1": img1,
    "img2": img2 == null ? '' : img2,
    "img3": img3 == null ? '' : img3,
    "img4": img4,
    "img5": img5,
    "price": price,
    "selling_price": sellingPrice == null ? '' : sellingPrice,
    "description": description,
  };
}
