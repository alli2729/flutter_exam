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
      floatingActionButton: _fab(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  //*Widgets

  Widget _fab() {
    return FloatingActionButton(
      onPressed: controller.addItem,
      child: const Icon(Icons.add),
    );
  }

  AppBar _appBar() => AppBar(
        centerTitle: true,
        title: const Text('Catagory'),
      );

  Widget _body() => Padding(
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
