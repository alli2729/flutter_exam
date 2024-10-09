import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fab(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      onPressed: controller.onLogin,
      child: const Icon(Icons.login),
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
            const Text('or', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            _register(),
          ],
        ),
      ),
    );
  }

  Widget _register() => InkWell(
        onTap: controller.onRegister,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.cyan,
          ),
          child: const Text(
            'REGISTER',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _username() {
    return TextFormField(
      controller: controller.userController,
      validator: controller.validate,
      decoration: InputDecoration(
        labelText: 'Username',
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
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('LOGIN'),
      centerTitle: true,
    );
  }
}
