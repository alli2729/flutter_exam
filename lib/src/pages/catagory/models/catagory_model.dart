import 'package:get/get.dart';

import '../../../infrastructure/common/item.dart';

class CatagoryModel {
  // Variable
  String title;
  RxList<Item> items;

  // Constractor
  CatagoryModel({
    required this.title,
    required this.items,
  });
  // Methods
  CatagoryModel copyWith(String? title, RxList<Item>? items) {
    return CatagoryModel(
        title: title ?? this.title, items: items ?? this.items);
  }
}
