class CategoryModel {
  // Variable
  int id;
  String title;

  // Constractor
  CategoryModel({
    required this.id,
    required this.title,
  });

  factory CategoryModel.fromJson({required Map<String, dynamic> json}) {
    return CategoryModel(
      id: json["id"],
      title: json["title"],
    );
  }

  @override
  String toString() {
    return title;
  }
}
