class CatagoryDto {
  String title;
  List<dynamic> itemsId;

  CatagoryDto({required this.title, required this.itemsId});

  Map<String, dynamic> toJason() {
    return {
      "title": title,
      "itemsId": itemsId,
    };
  }
}
