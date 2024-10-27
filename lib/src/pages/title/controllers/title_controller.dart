import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/items_model.dart';
import '../repositories/title_repository.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../../catagory/models/catagory_model.dart';
import '../models/catagory_dto.dart';

class TitleController extends GetxController {
  final CatagoryModel cat = Get.arguments ?? '';
  final TitleRepository _repository = TitleRepository();

  RxList<ItemModel> items = RxList();

  RxBool isLoading = false.obs;

  Future<void> getItems() async {
    isLoading.value = true;
    final result = await _repository.getItems(ids: cat.itemsId);
    result?.fold(
      (error) {
        isLoading.value = false;
      },
      (list) {
        isLoading.value = false;
        items.value = list;
      },
    );
  }

  // Future<void> addItem() async {
  // final result = await Get.toNamed(RouteNames.addItem);
  // if (result != null) {
  //   int price = int.parse(result[1]);
  //   cat.items.add(Item(name: result[0], price: price));
  //   refresh();
  // }
  // }

  Future<void> edit(int index) async {
    final result = await Get.toNamed(
      RouteNames.editItem,
      arguments: items[index].id,
    );
    if (result != null) {
      double price = result["price"];
      ItemModel newItem = items[index].copyWith();
      newItem.name = result["title"];
      newItem.price = price;
      items[index] = newItem;
    }
  }

  Future<void> remove(int index) async {
    final List<dynamic> newList = cat.itemsId;
    newList.removeAt(index);
    final CatagoryDto dto = CatagoryDto(title: cat.title, itemsId: newList);
    final result = await _repository.removeItem(id: cat.id, dto: dto);

    result?.fold(
      (error) {
        _showFailSnackBar(error);
      },
      (success) {
        items.removeAt(index);
      },
    );
  }

  void _showFailSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: Colors.red.shade300,
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void onInit() {
    super.onInit();
    getItems();
  }
}
