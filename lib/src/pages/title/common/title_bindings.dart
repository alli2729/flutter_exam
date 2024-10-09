import 'package:get/get.dart';
import '../controllers/title_controller.dart';

class TitleBindings extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => TitleController());
}
