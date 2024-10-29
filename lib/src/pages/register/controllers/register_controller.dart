import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils/utils.dart';
import '../models/register_dto.dart';
import '../repositories/register_repository.dart';

class RegisterController extends GetxController {
  final RegisterRepository _repository = RegisterRepository();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final rPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  Future<void> onRegister() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (passController.text != rPassController.text) {
      Utils.showFailSnackBar('Password is not matching');
      return;
    }
    isLoading.value = true;

    final RegisterDto dto = RegisterDto(
      name: userController.text,
      password: passController.text,
    );

    final result = await _repository.register(dto);

    result?.fold(
      (exception) {
        isLoading.value = false;
        Utils.showFailSnackBar(exception);
      },
      (map) {
        isLoading.value = false;
        Get.back(result: map);
      },
    );
  }

  void onLogin() => Get.back();

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    passController.dispose();
    rPassController.dispose();
  }
}
