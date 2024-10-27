class EditItemDto {
  String title;
  double price;

  EditItemDto({required this.title, required this.price});

  Map<String, dynamic> toJson() => {
      "title": title,
      "price": price,
    };
}
