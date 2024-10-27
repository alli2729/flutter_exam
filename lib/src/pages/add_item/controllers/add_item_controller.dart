import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/add_item_repository.dart';
import '../../catagory/models/catagory_model.dart';
import '../models/add_item_dto.dart';
import '../models/add_catagory_dto.dart';

class AddItemController extends GetxController {
  final CatagoryModel cat = Get.arguments ?? '';
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AddItemRepository _repository = AddItemRepository();
  RxBool isLoading = false.obs;

  Future<void> addItem() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;

    final double price = double.parse(priceController.text);
    final AddItemDto dto = AddItemDto(title: nameController.text, price: price);

    final result = await _repository.addItemToItems(itemDto: dto);

    result?.fold(
      (exception) {
        _showFailSnackBar(exception);
        isLoading.value = false;
      },
      (map) {
        addItemToCatagory(map);
      },
    );
  }

  Future<void> addItemToCatagory(Map<String, dynamic> item) async {
    final map = await _repository.getCatagory(catagoryId: cat.id);
    final CatagoryModel catagoryModel =
        CatagoryModel.fromJson(json: map!.right);

    final List newList = catagoryModel.itemsId;
    newList.add(item["id"]);
    catagoryModel.itemsId = newList;

    final AddCatagoryDto dto = AddCatagoryDto(
      title: cat.title,
      itemsId: newList,
    );

    final result = await _repository.addItemToCatagory(
      catagoryDto: dto,
      catagoryId: cat.id,
    );

    result?.fold(
      (exception) {
        _showFailSnackBar(exception);
        isLoading.value = false;
      },
      (success) {
        isLoading.value = false;
        Get.back<Map<String, dynamic>>(result: item);
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

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }
}
