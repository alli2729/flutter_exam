import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils/utils.dart';
import '../repositories/add_item_repository.dart';
import '../models/add_item_dto.dart';

class AddItemController extends GetxController {
  int categoryId;
  AddItemController({required this.categoryId});

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AddItemRepository _repository = AddItemRepository();
  RxBool isLoading = false.obs;

  Future<void> addItem() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;

    final double price = double.parse(priceController.text);
    final AddItemDto dto = AddItemDto(
      title: nameController.text,
      price: price,
      categoryId: categoryId,
    );

    final result = await _repository.addItemToItems(itemDto: dto);

    result?.fold(
      (exception) {
        Utils.showFailSnackBar(exception);
        isLoading.value = false;
      },
      (item) {
        Get.back<Map<String, dynamic>>(result: item);
      },
    );
  }

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
  }
}
