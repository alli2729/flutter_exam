class ItemModel {
  // Variable
  int id;
  String name;
  double price;
  // Constractor
  ItemModel({required this.name, required this.price, required this.id});

  // Methods
  ItemModel copyWith({String? name, double? price}) {
    return ItemModel(
        id: id, name: name ?? this.name, price: price ?? this.price);
  }

  factory ItemModel.fromJason(Map<String, dynamic> json) {
    return ItemModel(id: json["id"], name: json["title"], price: json["price"]);
  }
}
