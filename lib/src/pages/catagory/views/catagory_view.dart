import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import '../controllers/catagory_controller.dart';
import 'widgets/catagory_widget.dart';

class CatagoryView extends GetView<CatagoryController> {
  const CatagoryView({super.key});

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
        onPressed: controller.getCatagories,
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
        title: const Text('Catagory'),
      );

  Widget _success() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Obx(
          () => ListView.separated(
            itemCount: controller.catagorires.length,
            itemBuilder: (_, index) => CatagoryWidget(
              catagory: controller.catagorires[index],
              onTap: () => controller.goToItems(index),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
          ),
        ),
      );
}
