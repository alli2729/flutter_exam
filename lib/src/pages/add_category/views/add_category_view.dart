import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/locales.g.dart';
import '../controllers/add_category_controller.dart';

class AddCategoryView extends GetView<AddCategoryController> {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => _fab()),
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _fab() {
    return (controller.isLoading.value)
        ? FloatingActionButton(
            onPressed: null,
            child: Transform.scale(
              scale: 0.5,
              child: const CircularProgressIndicator(),
            ),
          )
        : FloatingActionButton(
            onPressed: controller.onSubmit,
            child: const Icon(Icons.check),
          );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(LocaleKeys.flutter_exam_add_category_page_addCategory.tr),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  Widget _body() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: controller.formKey,
          child: TextFormField(
            validator: controller.validate,
            controller: controller.titleController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: LocaleKeys.flutter_exam_add_category_page_title.tr,
            ),
          ),
        ),
      ),
    );
  }
}
