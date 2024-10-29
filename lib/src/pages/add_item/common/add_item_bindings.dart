import '../controllers/add_item_controller.dart';
import 'package:get/get.dart';

class AddItemBindings extends Bindings {
  @override
  void dependencies() {
    int? id = int.parse(Get.parameters["categoryId"] ?? '');
    Get.lazyPut(() => AddItemController(categoryId: id));
  }
}
