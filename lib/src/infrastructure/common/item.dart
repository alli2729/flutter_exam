class Item {
  // Variable
  String name;
  int price;
  // Constractor
  Item({required this.name, required this.price});

  // Methods
  Item copyWith({String? name, int? price}) {
    return Item(name: name ?? this.name, price: price ?? this.price);
  }
}
