class AddCatagoryDto {
  String title;
  List itemsId = [];
  double totalPrice;

  AddCatagoryDto({required this.title, required this.totalPrice});

  Map<String, dynamic> toJson() => {
        "title": title,
        "itemsId": itemsId,
        "totalPrice": totalPrice,
      };
}
