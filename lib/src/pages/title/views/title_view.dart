import 'widgets/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/title_controller.dart';

class TitleView extends GetView<TitleController> {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _fab(),
      appBar: _appBar(),
      body: Obx(() => _body()),
    );
  }

  Widget _body() {
    if (controller.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return _success();
  }

  Widget _fab() => FloatingActionButton(
        onPressed: controller.addItem,
        child: const Icon(Icons.add),
  );

  AppBar _appBar() {
    return AppBar(
      title: Text(controller.cat.title),
      centerTitle: true,
    );
  }

  Widget _success() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Obx(
          () => ListView.separated(
            itemCount: controller.items.length,
            itemBuilder: (_, index) => ItemsWidget(
              item: controller.items[index],
              onEdit: () => controller.edit(index),
              onRemove: () => controller.remove(index),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
          ),
        ),
      );
}
