import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/items_model.dart';
import '../repositories/title_repository.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../models/catagory_model.dart';
import '../models/catagory_dto.dart';

class TitleController extends GetxController {
  int? catagoryId;
  TitleController({required this.catagoryId});

  Rx<CatagoryModel> cat = Rx(CatagoryModel(id: 0, title: 'title', itemsId: []));

  final TitleRepository _repository = TitleRepository();
  RxList<ItemModel> items = RxList();
  RxBool isLoading = false.obs;

  Future<void> addItem() async {
    final result = await Get.toNamed(
      RouteNames.addItem,
      parameters: {"catagoryId": "${cat.value.id}"},
    );
    if (result != null) {
      items.add(ItemModel(
        id: result["id"],
        name: result["title"],
        price: result["price"],
      ));
    }
  }

  Future<void> edit(int index) async {
    final result = await Get.toNamed(
      RouteNames.editItem,
      parameters: {"itemId": "${items[index].id}"},
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
    final List<dynamic> newList = cat.value.itemsId;
    newList.removeAt(index);
    final CatagoryDto dto =
        CatagoryDto(title: cat.value.title, itemsId: newList);
    final result = await _repository.removeItem(id: cat.value.id, dto: dto);

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

  Future<void> getCatagoryById(int id) async {
    isLoading.value = true;
    final result = await _repository.getCatagoryById(id: id);
    result?.fold(
      (exception) {
        _showFailSnackBar(exception);
        isLoading.value = false;
      },
      (catagory) {
        cat.value = CatagoryModel.fromJson(json: catagory);
        getItems();
      },
    );
  }

  Future<void> getItems() async {
    isLoading.value = true;
    final result = await _repository.getItems(ids: cat.value.itemsId);
    result?.fold(
      (error) {
        isLoading.value = false;
      },
      (list) {
        items.value = list;
        isLoading.value = false;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getCatagoryById(catagoryId!);
  }
}
