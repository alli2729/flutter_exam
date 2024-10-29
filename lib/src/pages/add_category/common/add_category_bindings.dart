import 'package:get/get.dart';
import '../controllers/add_category_controller.dart';

class AddCategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCategoryController());
  }
}
