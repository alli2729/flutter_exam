class AddCategoryDto {
  String title;

  AddCategoryDto({required this.title});

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
