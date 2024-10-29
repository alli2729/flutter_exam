class ItemModel {
  // Variable
  int id;
  int categoryId;
  String name;
  double price;

  // Constractor
  ItemModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
  });

  // Methods
  ItemModel copyWith({String? name, double? price}) {
    return ItemModel(
      id: id,
      categoryId: categoryId,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  factory ItemModel.fromJason(Map<String, dynamic> json) {
    return ItemModel(
      categoryId: json["categoryId"],
      id: json["id"],
      name: json["name"],
      price: json["price"],
    );
  }
}
