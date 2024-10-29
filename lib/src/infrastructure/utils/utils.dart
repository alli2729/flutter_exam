import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  Utils._();

  static void showFailSnackBar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.shade300,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  static void showSuccessSnackBar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.withOpacity(.5),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
