class AddCatagoryDto {
  String title;
  List itemsId = [];

  AddCatagoryDto({required this.title});

  Map<String, dynamic> toJson() => {
        "title": title,
        "itemsId": itemsId,
      };
}
