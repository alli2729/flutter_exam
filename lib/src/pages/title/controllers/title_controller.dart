import 'package:get/get.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../../catagory/models/catagory_model.dart';
import '../../../infrastructure/common/item.dart';

class TitleController extends GetxController {
  final CatagoryModel cat = Get.arguments ?? '';

  Future<void> addItem() async {
    final result = await Get.toNamed(RouteNames.addItem);
    if (result != null) {
      int price = int.parse(result[1]);
      cat.items.add(Item(name: result[0], price: price));
      refresh();
    }
  }

  Future<void> edit(int index) async {
    final result = await Get.toNamed(
      RouteNames.editItem,
      arguments: cat.items[index],
    );
    if (result != null) {
      int price = int.parse(result[1]);
      Item newItem = cat.items[index].copyWith();
      newItem.name = result[0];
      newItem.price = price;

      cat.items[index] = newItem;
    }
  }

  void remove(int index) {
    cat.items.removeAt(index);
  }
}
