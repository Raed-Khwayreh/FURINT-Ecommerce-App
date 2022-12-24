// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String? id;
  String name;
  double? rate;
  int? reviews;
  int? orders;
  String oldPrice;
  String newPrice;
  String image;
  bool? fav;
  String? catId;
  String? category;
  ProductModel(
      {required this.name,
      this.rate,
      this.orders,
      this.reviews,
      required this.oldPrice,
      required this.newPrice,
      required this.image,
      this.fav,
      required this.category,
      this.catId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rate': rate,
      'reviews': reviews,
      'orders': orders,
      'oldPrice': oldPrice,
      'newPrice': newPrice,
      'image': image,
      'fav': fav,
      'catId': catId,
      'category': category,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      oldPrice: map['image'] as String,
      newPrice: map['image'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
