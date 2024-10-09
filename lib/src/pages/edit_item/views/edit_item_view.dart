import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_item_controller.dart';

class EditItemView extends GetView<EditItemController> {
  const EditItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _fab(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      onPressed: controller.edit,
      child: const Icon(Icons.check),
    );
  }

  AppBar _appBar() => AppBar(
        title: const Text('Edit Item'),
        centerTitle: true,
      );

  Widget _body() {
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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Price',
      ),
    );
  }

  Widget _name() {
    return TextFormField(
      validator: controller.validate,
      controller: controller.nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name',
      ),
    );
  }
}
