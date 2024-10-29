class AddItemDto {
  int categoryId;
  String title;
  double price;

  AddItemDto({
    required this.title,
    required this.price,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      "categoryId": categoryId,
      "name": title,
      "price": price,
    };
  }
}
