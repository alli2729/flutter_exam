import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/common/item.dart';

class EditItemController extends GetxController {
  final Item item = Get.arguments ?? '';
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    nameController.text = item.name;
    priceController.text = item.price.toString();
  }

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  void edit() {
    if (formKey.currentState?.validate() ?? false) {
      Get.back<List<String>>(
        result: [nameController.text, priceController.text],
      );
    }
  }
}
