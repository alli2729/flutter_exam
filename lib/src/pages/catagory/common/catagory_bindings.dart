import 'package:get/get.dart';
import '../controllers/catagory_controller.dart';

class CatagoryBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CatagoryController());
}
