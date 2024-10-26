import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/add_catagory_repository.dart';
import '../models/add_catagory_dto.dart';

class AddCatagoryController extends GetxController {
  final AddCatagoryRepository _repository = AddCatagoryRepository();
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  Future<void> onSubmit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;

    final AddCatagoryDto dto = AddCatagoryDto(title: titleController.text);

    final result = await _repository.addCatagory(dto: dto);
    result?.fold(
      (error) {
        isLoading.value = false;
        _showFailSnackBar(error);
      },
      (map) {
        isLoading.value = false;
        Get.back<Map<String, dynamic>>(result: map);
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
}
