import '../../../infrastructure/common/item.dart';

class CatagoryModel {
  // Variable
  String title;
  List<dynamic> itemsId;

  // Constractor
  CatagoryModel({
    required this.title,
    required this.itemsId,
  });
  // Methods
  CatagoryModel copyWith(
      {String? title, List<Item>? items, List<dynamic>? itemsId}) {
    return CatagoryModel(
      title: title ?? this.title,
      itemsId: itemsId ?? this.itemsId,
    );
  }

  factory CatagoryModel.fromJson({required Map<String, dynamic> json}) {
    return CatagoryModel(
      title: json["title"],
      itemsId: json["itemsId"],
    );
  }

  @override
  String toString() {
    return '$title $itemsId';
  }
}
