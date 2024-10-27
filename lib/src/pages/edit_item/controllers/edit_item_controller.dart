import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/edit_item_dto.dart';
import '../models/items_model.dart';
import '../repositories/edit_item_repository.dart';

class EditItemController extends GetxController {
  final int itemId = Get.arguments ?? '';
  final EditItemRepository _repository = EditItemRepository();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  ItemModel item = ItemModel(name: 'name', price: 0, id: 0);

  Future<void> findItem(int id) async {
    isLoading.value = true;
    final result = await _repository.findItem(id: id);
    result?.fold(
      (exception) {
        isLoading.value = false;
        _showFailSnackBar(exception);
      },
      (map) {
        item = ItemModel.fromJason(map);
        nameController.text = item.name;
        priceController.text = item.price.toString();
        isLoading.value = false;
      },
    );
  }

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  Future<void> edit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isSubmitting.value = true;

    double editedPrice = double.parse(priceController.text);

    final EditItemDto dto = EditItemDto(
      title: nameController.text,
      price: editedPrice,
    );

    final result = await _repository.editItem(dto: dto, id: item.id);

    result?.fold(
      (exception) {
        isSubmitting.value = false;
        _showFailSnackBar(exception);
      },
      (success) {
        isSubmitting.value = false;
        Get.back<Map<String, dynamic>>(result: {
          "title": nameController.text,
          "price": editedPrice,
        });
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
    findItem(itemId);
  }
}
