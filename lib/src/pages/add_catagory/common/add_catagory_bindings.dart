import 'package:get/get.dart';
import '../controllers/add_catagory_controller.dart';

class AddCatagoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCatagoryController());
  }
}
