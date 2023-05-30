class Cake {
  final int id;
  final String name;
  final int price;
  final String image;
  final String desc;
  final int categoryId;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedAt;

  Cake({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.desc,
    required this.categoryId,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cake.fromJson(Map<String, dynamic> json) => Cake(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    image: json["image"],
    desc: json["desc"],
    categoryId: json["category_id"],
    stock: json["stock"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "image": image,
    "desc": desc,
    "category_id": categoryId,
    "stock": stock,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
