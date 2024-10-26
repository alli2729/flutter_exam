import 'package:exam/src/pages/title/models/items_model.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({
    super.key,
    required this.item,
    required this.onEdit,
    required this.onRemove,
  });

  final ItemModel item;
  final void Function() onEdit;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.cyan[100],
      ),
      child: Row(
        children: [
          Text(item.name, style: const TextStyle(fontSize: 20)),
          const Spacer(),
          Text('${item.price} T', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          _editButton(),
          _removeButton(),
        ],
      ),
    );
  }

  Widget _editButton() => IconButton(
        onPressed: onEdit,
        icon: const Icon(Icons.edit_rounded),
      );

  Widget _removeButton() => IconButton(
        onPressed: onRemove,
        icon: Icon(Icons.remove_circle, color: Colors.red[300]),
      );
}
