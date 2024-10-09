import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemController extends GetxController {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  void onSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      Get.back<List<String>>(
          result: [nameController.text, priceController.text]);
    }
  }
}
