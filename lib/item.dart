import 'dart:convert';

class Item {
  Item({
    required this.rowId,
    required this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.weight,
    required this.options,
    required this.discount,
    required this.tax,
    required this.subtotal,
  });

  String rowId;
  int id;
  String name;
  String qty;
  int price;
  int weight;
  Options options;
  int discount;
  int tax;
  int subtotal;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        rowId: json["rowId"],
        id: json["id"],
        name: json["name"],
        qty: json["qty"],
        price: json["price"],
        weight: json["weight"],
        options: Options.fromJson(json["options"]),
        discount: json["discount"],
        tax: json["tax"],
        subtotal: json["subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "rowId": rowId,
        "id": id,
        "name": name,
        "qty": qty,
        "price": price,
        "weight": weight,
        "options": options.toJson(),
        "discount": discount,
        "tax": tax,
        "subtotal": subtotal,
      };
}

class Options {
  Options({
    required this.attributeId,
    required this.variantId,
    required this.image,
  });

  dynamic attributeId;
  String variantId;
  List<Image> image;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        attributeId: json["attribute_id"],
        variantId: json["variant_id"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attribute_id": attributeId,
        "variant_id": variantId,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.id,
    required this.productId,
    required this.productImage,
    required this.createdAt,
    required this.prefixUrl,
    required this.updatedAt,
  });

  int id;
  int productId;
  String productImage;
  DateTime createdAt;
  String prefixUrl;
  DateTime updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        productImage: json["product_image"],
        createdAt: DateTime.parse(json["created_at"]),
        prefixUrl: json["prefix_url"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_image": productImage,
        "created_at": createdAt.toIso8601String(),
        "prefix_url": prefixUrl,
        "updated_at": updatedAt.toIso8601String(),
      };
}
