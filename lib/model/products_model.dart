class ProductsModel {
  int id;
  String title;
  String price;
  String des;
  DateTime createdAt;
  DateTime updatedAt;
  int subcategoryId;
  int quantity;
  String imageUrl;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.des,
    required this.createdAt,
    required this.updatedAt,
    required this.subcategoryId,
    this.quantity = 1,
    required this.imageUrl,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        des: json["des"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        subcategoryId: json["subcategory_id"],
        quantity: 1,
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "des": des,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "subcategory_id": subcategoryId,
        "quantity": quantity,
        "imageUrl": imageUrl,
      };
}
