import 'package:get/get.dart';
import '../controllers/category_controller.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CatagoryController());
}
