class EditItemDto {
  String title;
  double price;
  int categoryId;

  EditItemDto({
    required this.title,
    required this.price,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() => {
        "name": title,
        "price": price,
        "categoryId": categoryId,
      };
}
