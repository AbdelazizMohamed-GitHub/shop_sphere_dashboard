// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

class ProductModel extends ProductEntity {
   final String id;
   final String sId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;

  ProductModel({
    required this.id,
    required this.sId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
  }) : super(id: id, name: name, description: description, price: price, image: imageUrl, category: category, stock: stock);



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sId': sId,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'stock': stock,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      sId: map['sId'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      imageUrl: map['imageUrl'] as String,
      category: map['category'] as String,
      stock: map['stock'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, sId: $sId, name: $name, description: $description, price: $price, imageUrl: $imageUrl, category: $category, stock: $stock)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sId == sId &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.category == category &&
      other.stock == stock;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sId.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      category.hashCode ^
      stock.hashCode;
  }
}
