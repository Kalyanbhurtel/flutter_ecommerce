// To parse this JSON data, do
//
//     final produtModel = produtModelFromJson(jsonString);

import 'dart:convert';

ProdutModel produtModelFromJson(String str) => ProdutModel.fromJson(json.decode(str));

String produtModelToJson(ProdutModel data) => json.encode(data.toJson());

class ProdutModel {
    final bool? success;
    final Data? data;

    ProdutModel({
        this.success,
        this.data,
    });

    factory ProdutModel.fromJson(Map<String, dynamic> json) => ProdutModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    final int? count;
    final List<Product>? products;

    Data({
        this.count,
        this.products,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    final int? id;
    final String? name;
    final String? description;
    final String? price;
    final String? category;
    final String? discount;
    final int? stock;
    final String? imageUrl;
    final String? imagePublicId;

    Product({
        this.id,
        this.name,
        this.description,
        this.price,
        this.category,
        this.discount,
        this.stock,
        this.imageUrl,
        this.imagePublicId,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        discount: json["discount"],
        stock: json["stock"],
        imageUrl: json["image_url"],
        imagePublicId: json["image_public_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "discount": discount,
        "stock": stock,
        "image_url": imageUrl,
        "image_public_id": imagePublicId,
    };
}
