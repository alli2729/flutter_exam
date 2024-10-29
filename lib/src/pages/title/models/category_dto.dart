class CategoryDto {
  String title;

  CategoryDto({required this.title});

  Map<String, dynamic> toJason() {
    return {
      "title": title,
    };
  }
}
