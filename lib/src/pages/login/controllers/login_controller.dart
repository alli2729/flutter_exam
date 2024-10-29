import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/utils/utils.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../repositories/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository _repository = LoginRepository();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  Future<void> onLogin() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;

    final result = await _repository.login(
      name: userController.text,
      password: passController.text,
    );

    result?.fold(
      (exception) {
        isLoading.value = false;
        Utils.showFailSnackBar(exception);
      },
      (success) {
        isLoading.value = false;
        Get.offNamed(RouteNames.category);
      },
    );
  }

  Future<void> onRegister() async {
    final result = await Get.toNamed(RouteNames.register);
    if (result != null) {
      userController.text = result["name"];
      passController.text = result["password"];
      Utils.showSuccessSnackBar('user successfully created');
    }
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    userController.dispose();
  }
}
