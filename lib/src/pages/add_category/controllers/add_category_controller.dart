import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils/utils.dart';
import '../repositories/add_category_repository.dart';
import '../models/add_category_dto.dart';

class AddCategoryController extends GetxController {
  final AddCategoryRepository _repository = AddCategoryRepository();
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  Future<void> onSubmit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;

    final AddCategoryDto dto = AddCategoryDto(title: titleController.text);

    final result = await _repository.addCetagory(dto: dto);
    result?.fold(
      (error) {
        isLoading.value = false;
        Utils.showFailSnackBar(error);
      },
      (map) {
        isLoading.value = false;
        Get.back<Map<String, dynamic>>(result: map);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }
}
