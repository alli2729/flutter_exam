class ItemModel {
  // Variable
  int id;
  int categoryId;
  String name;
  double price;
  // Constractor
  ItemModel({
    required this.name,
    required this.price,
    required this.id,
    required this.categoryId,
  });

  factory ItemModel.fromJason(Map<String, dynamic> json) {
    return ItemModel(
      id: json["id"],
      categoryId: json["categoryId"],
      name: json["name"],
      price: json["price"],
    );
  }

  @override
  String toString() {
    return '$id , $name , $price';
  }
}
