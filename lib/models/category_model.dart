// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CateModel {
  String? id;
  String name;
  String image;
  bool? isSelected;
  CateModel({
    required this.name,
    required this.image,
    this.isSelected,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'isSelected': isSelected,
    };
  }

  factory CateModel.fromMap(Map<String, dynamic> map) {
    return CateModel(
      name: map['name'] as String,
      image: map['image'] as String,
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CateModel.fromJson(String source) =>
      CateModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
