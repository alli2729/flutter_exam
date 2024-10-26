import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../models/catagory_model.dart';
import '../repositories.dart/catagory_repository.dart';

class CatagoryController extends GetxController {
  final CatagoryRepository _repository = CatagoryRepository();
  RxList<CatagoryModel> catagorires = RxList();
  // RxList<dynamic> totals = RxList();

  RxBool isLoading = false.obs;
  RxBool isRetry = false.obs;

  // Future<void> getTotal() async {
  //   isLoading.value = true;
  //   for (var i = 0; i < catagorires.length; i++) {
  //     totals.add(await _repository.getTotal(catagorires[i].itemsId));
  //   }
  //   // isLoading.value = false;
  // }

  Future<void> getCatagories() async {
    isLoading.value = true;
    isRetry.value = false;
    final result = await _repository.getCatagories();
    result?.fold(
      (exception) {
        isLoading.value = false;
        isRetry.value = true;
        _showFailSnackBar(exception);
      },
      (catagories) {
        isLoading.value = false;
        isRetry.value = false;
        catagorires.addAll(catagories);
      },
    );
  }

  Future<void> goToItems(int index) async {
    final CatagoryModel cat = catagorires[index];
    Get.toNamed(RouteNames.title, arguments: cat);
  }

  Future<void> addItem() async {
    final result = await Get.toNamed(RouteNames.addCatagory);
    if (result != null) {
      catagorires.add(CatagoryModel.fromJson(json: result));
    }
  }

  void _showFailSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: Colors.red.shade300,
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void onInit() {
    super.onInit();
    getCatagories();
    // getTotal();
  }
}
