import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import '../../../../generated/locales.g.dart';
import '../controllers/category_controller.dart';
import 'widgets/category_widget.dart';

class CategoryView extends GetView<CatagoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => _fab()),
      appBar: _appBar(),
      body: Obx(() => _body()),
    );
  }

  Widget _body() {
    if (controller.isLoading.value) {
      return _loading();
    } else if (controller.isRetry.value) {
      return _retry();
    }
    return _success();
  }

  //*Widgets

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _retry() {
    return Center(
      child: IconButton(
        onPressed: controller.getCetagories,
        icon: const Icon(Icons.change_circle),
      ),
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      onPressed: (controller.isLoading.value || controller.isRetry.value)
          ? null
          : controller.addItem,
      child: const Icon(Icons.add),
    );
  }

  AppBar _appBar() => AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.flutter_exam_category_page_category.tr),
      );

  Widget _success() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Obx(
          () => ListView.separated(
            itemCount: controller.catagorires.length,
            itemBuilder: (_, index) => CategoryWidget(
              catagory: controller.catagorires[index],
              // total: controller.totals[index],
              total: 0,
              onTap: () => controller.goToItems(index),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
          ),
        ),
      );
}
