import '../controllers/edit_item_controller.dart';
import 'package:get/get.dart';

class EditItemBindings extends Bindings {
  @override
  void dependencies() {
    int? id = int.parse(Get.parameters["itemId"] ?? '');
    Get.lazyPut(() => EditItemController(itemId: id));
  }
}
