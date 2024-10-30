import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/locales.g.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _username(),
            const SizedBox(height: 16),
            _password(),
            const SizedBox(height: 16),
            Obx(() => _login()),
            const SizedBox(height: 16),
            _orText(),
            const SizedBox(height: 16),
            Obx(() => _register()),
          ],
        ),
      ),
    );
  }

  Widget _orText() {
    return Text(
      LocaleKeys.flutter_exam_login_page_or.tr,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _login() => InkWell(
        onTap: (controller.isLoading.value) ? null : controller.onLogin,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: (controller.isLoading.value) ? Colors.grey : Colors.cyan,
          ),
          child: Text(
            LocaleKeys.flutter_exam_login_page_login.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _register() => InkWell(
        onTap: (controller.isLoading.value) ? null : controller.onRegister,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          LocaleKeys.flutter_exam_login_page_register.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: (controller.isLoading.value) ? Colors.grey : Colors.blue,
          ),
        ),
      );

  Widget _username() {
    return TextFormField(
      controller: controller.userController,
      validator: controller.validate,
      decoration: InputDecoration(
        labelText: LocaleKeys.flutter_exam_login_page_username.tr,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _password() {
    return TextFormField(
      controller: controller.passController,
      validator: controller.validate,
      obscureText: true,
      decoration: InputDecoration(
        labelText: LocaleKeys.flutter_exam_login_page_password.tr,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(LocaleKeys.flutter_exam_login_page_login.tr),
      centerTitle: true,
    );
  }
}
