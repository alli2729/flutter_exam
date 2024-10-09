import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddCatagoryController extends GetxController {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  void onSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      Get.back<String>(result: controller.text);
    }
  }
}
