// To parse this JSON data, do
//
//     final grocery = groceryFromJson(jsonString);

import 'dart:convert';

Grocery groceryFromJson(String str) => Grocery.fromJson(json.decode(str));

String groceryToJson(Grocery data) => json.encode(data.toJson());

class Grocery {
  List<Store> stores;

  Grocery({required this.stores});

  factory Grocery.fromJson(Map<String, dynamic> json) => Grocery(
    stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
  };
}

class Store {
  String storeName;
  String distanceTime;
  String rating;
  String imageUrl;
  List<Product> products;

  Store({
    required this.storeName,
    required this.distanceTime,
    required this.rating,
    required this.imageUrl,
    required this.products,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    storeName: json["storeName"],
    distanceTime: json["distanceTime"],
    rating: json["rating"],
    imageUrl: json["imageUrl"],
    products: List<Product>.from(
      json["products"].map((x) => Product.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "storeName": storeName,
    "distanceTime": distanceTime,
    "rating": rating,
    "imageUrl": imageUrl,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  String name;
  String description;
  double price;
  int quantity;
  String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    quantity: json["quantity"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "price": price,
    "quantity": quantity,
    "imageUrl": imageUrl,
  };
}
