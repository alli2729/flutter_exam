class ItemModel {
  // Variable
  int id;
  int catagoryId;
  String name;
  int price;
  // Constractor
  ItemModel({
    required this.id,
    required this.catagoryId,
    required this.name,
    required this.price,
  });

  // // Methods
  // ItemModel copyWith({String? name, int? price}) {
  //   return ItemModel(name: name ?? this.name, price: price ?? this.price);
  // }
}
