import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/locales.g.dart';
import '../controllers/edit_item_controller.dart';

class EditItemView extends GetView<EditItemController> {
  const EditItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => _fab()),
      appBar: _appBar(),
      body: Obx(() => _body()),
    );
  }

  Widget _fab() {
    return (controller.isSubmitting.value)
        ? FloatingActionButton(
            onPressed: null,
            child: Transform.scale(
              scale: 0.5,
              child: const CircularProgressIndicator(),
            ),
          )
        : FloatingActionButton(
            onPressed: controller.edit,
            child: const Icon(Icons.check),
          );
  }

  AppBar _appBar() => AppBar(
        title: Text(LocaleKeys.flutter_exam_edit_item_page_editItem.tr),
        centerTitle: true,
      );

  Widget _body() {
    if (controller.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return _success();
  }

  Widget _success() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _name(),
            const SizedBox(height: 20),
            _price(),
          ],
        ),
      ),
    );
  }

  Widget _price() {
    return TextFormField(
      validator: controller.validate,
      controller: controller.priceController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: LocaleKeys.flutter_exam_edit_item_page_price.tr,
      ),
    );
  }

  Widget _name() {
    return TextFormField(
      validator: controller.validate,
      controller: controller.nameController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: LocaleKeys.flutter_exam_edit_item_page_name.tr,
      ),
    );
  }
}
