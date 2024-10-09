import 'package:get/get.dart';
import '../models/catagory_model.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../../../infrastructure/common/database.dart';

class CatagoryController extends GetxController {
  List<CatagoryModel> catagorires = Database.catagories;

  Future<void> goToItems(int index) async {
    final CatagoryModel cat = catagorires[index];
    Get.toNamed(RouteNames.title, arguments: cat);
  }

  Future<void> addItem() async {
    final result = await Get.toNamed(RouteNames.addCatagory);
    if (result != null) {
      catagorires.add(CatagoryModel(title: result, items: RxList([])));
    }
  }
}
