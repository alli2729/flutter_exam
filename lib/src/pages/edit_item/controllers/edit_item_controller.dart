import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils/utils.dart';
import '../models/edit_item_dto.dart';
import '../models/item_model.dart';
import '../repositories/edit_item_repository.dart';

class EditItemController extends GetxController {
  final int itemId;
  EditItemController({required this.itemId});

  final EditItemRepository _repository = EditItemRepository();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  ItemModel item = ItemModel(name: 'name', price: 0, id: 0, categoryId: 0);

  Future<void> findItem(int id) async {
    isLoading.value = true;
    final result = await _repository.findItem(id: id);
    result?.fold(
      (exception) {
        isLoading.value = false;
        Utils.showFailSnackBar(exception);
      },
      (itemModel) {
        item = ItemModel.fromJason(itemModel);
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
      categoryId: item.categoryId,
    );

    final result = await _repository.editItem(dto: dto, id: item.id);

    result?.fold(
      (exception) {
        isSubmitting.value = false;
        Utils.showFailSnackBar(exception);
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

  @override
  void onInit() {
    super.onInit();
    findItem(itemId);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
  }
}
