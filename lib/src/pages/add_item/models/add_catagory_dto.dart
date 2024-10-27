class AddCatagoryDto {
  String title;
  List itemsId = [];

  AddCatagoryDto({required this.title, required this.itemsId});

  Map<String, dynamic> toJson() => {
        "title": title,
        "itemsId": itemsId,
      };
}
