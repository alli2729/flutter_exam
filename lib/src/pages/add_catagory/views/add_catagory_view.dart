import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_catagory_controller.dart';

class AddCatagoryView extends GetView<AddCatagoryController> {
  const AddCatagoryView({super.key});

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
      onPressed: controller.onSubmit,
      child: const Icon(Icons.check),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Add Catagory'),
      centerTitle: true,
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
            controller: controller.controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
        ),
      ),
    );
  }
}
