import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/catagory_model.dart';

class CatagoryWidget extends StatelessWidget {
  const CatagoryWidget({
    super.key,
    required this.catagory,
    required this.onTap,
  });

  final CatagoryModel catagory;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Text(catagory.title, style: const TextStyle(fontSize: 20)),
            const Spacer(),
            Obx(() =>
                Text('Total: ${sum()}', style: const TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }

  RxInt sum() {
    int sum = 0;
    for (int i = 0; i < catagory.items.length; i++) {
      sum += catagory.items[i].price;
    }
    return sum.obs;
  }
}
