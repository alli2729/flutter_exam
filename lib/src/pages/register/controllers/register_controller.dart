import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/common/database.dart';

class RegisterController extends GetxController {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final rPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  void onRegister() {
    if (formKey.currentState?.validate() ?? false) {
      if (passController.text == rPassController.text) {
        Database.userCred[userController.text] = passController.text;
        Get.back(result: [userController.text, passController.text]);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Password is not matching',
            backgroundColor: Colors.red.withOpacity(.5),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void onLogin() => Get.back();
}
