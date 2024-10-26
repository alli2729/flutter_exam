class AddItemDto {
  String title;
  double price;

  AddItemDto({required this.title, required this.price});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "price": price,
    };
  }
}
