import 'items_model.dart';

class CatagoryModel {
  // Variable
  int id;
  String title;
  List<dynamic> itemsId;
  double totalPrice;

  // Constractor
  CatagoryModel({
    required this.id,
    required this.title,
    required this.itemsId,
    required this.totalPrice,
  });
  // Methods
  CatagoryModel copyWith({
    String? title,
    List<ItemModel>? items,
    List<dynamic>? itemsId,
    double? totalPrice,
  }) {
    return CatagoryModel(
      id: id,
      title: title ?? this.title,
      itemsId: itemsId ?? this.itemsId,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  factory CatagoryModel.fromJson({required Map<String, dynamic> json}) {
    return CatagoryModel(
      id: json["id"],
      title: json["title"],
      itemsId: json["itemsId"],
      totalPrice: json["totalPrice"],
    );
  }

  @override
  String toString() {
    return '$title $itemsId total: $totalPrice';
  }
}
