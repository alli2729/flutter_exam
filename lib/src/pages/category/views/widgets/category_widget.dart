import 'package:flutter/material.dart';
import '../../models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.catagory,
    required this.onTap,
    required this.total,
  });

  final CategoryModel catagory;
  final double? total;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(catagory.title, style: const TextStyle(fontSize: 20)),
            // Text('Total: $total', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
