import 'items_model.dart';

class CatagoryModel {
  // Variable
  int id;
  String title;
  List<dynamic> itemsId;

  // Constractor
  CatagoryModel({
    required this.id,
    required this.title,
    required this.itemsId,
  });
  // Methods
  CatagoryModel copyWith(
      {String? title, List<ItemModel>? items, List<dynamic>? itemsId}) {
    return CatagoryModel(
      id: id,
      title: title ?? this.title,
      itemsId: itemsId ?? this.itemsId,
    );
  }

  factory CatagoryModel.fromJson({required Map<String, dynamic> json}) {
    return CatagoryModel(
      id: json["id"],
      title: json["title"],
      itemsId: json["itemsId"],
    );
  }

  @override
  String toString() {
    return '$title $itemsId';
  }
}
