class CatagoryDto {
  String title;
  List<dynamic> itemsId;
  double totalPrice;

  CatagoryDto({
    required this.title,
    required this.itemsId,
    required this.totalPrice,
  });

  Map<String, dynamic> toJason() {
    return {
      "title": title,
      "itemsId": itemsId,
      "totalPrice": totalPrice,
    };
  }
}
