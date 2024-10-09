import '../controllers/edit_item_controller.dart';
import 'package:get/get.dart';

class EditItemBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditItemController());
  }
}
