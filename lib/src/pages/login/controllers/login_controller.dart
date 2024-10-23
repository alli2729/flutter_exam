import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../repositories/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository _repo = LoginRepository();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  Future<void> onLogin() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final result = await _repo.login(userController.text, passController.text);
    result?.fold(
      (exception) {
        _showSnackBar(exception);
      },
      (success) {
        Get.offNamed(RouteNames.catagory);
      },
    );
  }

  void _showSnackBar(String value) {
    Get.showSnackbar(
      GetSnackBar(
        message: value,
        backgroundColor: Colors.red.withOpacity(.5),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void onRegister() async {
    final result = await Get.toNamed(RouteNames.register);
    if (result != null) {
      userController.text = result[0];
      passController.text = result[1];
    }
  }
}
