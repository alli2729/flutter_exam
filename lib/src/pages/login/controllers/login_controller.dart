import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        _showFailSnackBar(exception);
      },
      (success) {
        isLoading.value = false;
        Get.offNamed(RouteNames.catagory);
      },
    );
  }

  Future<void> onRegister() async {
    final result = await Get.toNamed(RouteNames.register);
    if (result != null) {
      userController.text = result["name"];
      passController.text = result["password"];
      _showSuccessSnackBar('user successfully created');
    }
  }

  void _showSuccessSnackBar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.withOpacity(.5),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showFailSnackBar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.withOpacity(.5),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    userController.dispose();
  }
}
