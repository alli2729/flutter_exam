import 'package:get/get.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../../../infrastructure/utils/utils.dart';
import '../models/category_model.dart';
import '../repositories/category_repository.dart';

class CatagoryController extends GetxController {
  final CatagoryRepository _repository = CatagoryRepository();
  RxList<CategoryModel> catagorires = RxList();
  RxBool isLoading = false.obs;
  RxBool isRetry = false.obs;

  Future<void> getCetagories() async {
    isLoading.value = true;
    isRetry.value = false;
    final result = await _repository.getCategories();
    result?.fold(
      (exception) {
        isLoading.value = false;
        isRetry.value = true;
        Utils.showFailSnackBar(exception);
      },
      (categories) {
        isLoading.value = false;
        isRetry.value = false;
        catagorires.addAll(categories);
      },
    );
  }

  Future<void> goToItems(int index) async {
    final CategoryModel cat = catagorires[index];
    Get.toNamed(RouteNames.title, parameters: {"categoryId": '${cat.id}'});
  }

  Future<void> addItem() async {
    final result = await Get.toNamed(RouteNames.addCategory);
    if (result != null) {
      catagorires.add(CategoryModel.fromJson(json: result));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCetagories();
  }
}
