import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/common/database.dart';
import '../../../infrastructure/routes/route_names.dart';

class LoginController extends GetxController {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'required';
    return null;
  }

  void onLogin() {
    if (formKey.currentState?.validate() ?? false) {
      if (Database.userCred[userController.text] == passController.text) {
        Get.offNamed(RouteNames.catagory);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Username or Password is wrong',
            backgroundColor: Colors.red.withOpacity(.5),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void onRegister() async {
    final result = await Get.toNamed(RouteNames.register);
    if (result != null) {
      userController.text = result[0];
      passController.text = result[1];
    }
  }
}
