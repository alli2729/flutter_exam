class ItemModel {
  // Variable
  String name;
  int price;
  // Constractor
  ItemModel({required this.name, required this.price});

  // Methods
  ItemModel copyWith({String? name, int? price}) {
    return ItemModel(name: name ?? this.name, price: price ?? this.price);
  }
}
