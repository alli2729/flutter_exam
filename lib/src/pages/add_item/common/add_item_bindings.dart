import '../controllers/add_item_controller.dart';
import 'package:get/get.dart';

class AddItemBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddItemController());
  }
}
