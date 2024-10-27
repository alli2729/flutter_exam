import 'package:get/get.dart';
import '../controllers/title_controller.dart';

class TitleBindings extends Bindings {
  @override
  void dependencies() {
    int? id = int.parse(Get.parameters["catagoryId"] ?? '');
    Get.lazyPut(() => TitleController(catagoryId: id));
  }
}
