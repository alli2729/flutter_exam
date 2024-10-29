import 'package:get/get.dart';
import '../../../infrastructure/utils/utils.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../models/item_model.dart';
import '../repositories/title_repository.dart';

class TitleController extends GetxController {
  int? categoryId;
  TitleController({required this.categoryId});

  final TitleRepository _repository = TitleRepository();
  RxList<ItemModel> items = RxList();
  RxBool isLoading = false.obs;

  Future<void> getItems() async {
    isLoading.value = true;
    final result = await _repository.getItems(categoryId: categoryId!);
    result?.fold(
      (error) {
        isLoading.value = false;
        Utils.showFailSnackBar(error);
      },
      (list) {
        items.value = list;
        isLoading.value = false;
      },
    );
  }

  Future<void> addItem() async {
    final result = await Get.toNamed(
      RouteNames.addItem,
      parameters: {"categoryId": "$categoryId"},
    );
    if (result != null) {
      items.add(ItemModel.fromJason(result));
    }
  }

  Future<void> edit(int index) async {
    final result = await Get.toNamed(
      RouteNames.editItem,
      parameters: {"itemId": "${items[index].id}"},
    );
    if (result != null) {
      double price = result["price"];
      ItemModel newItem = items[index].copyWith();
      newItem.name = result["title"];
      newItem.price = price;
      items[index] = newItem;
    }
  }

  Future<void> remove(int index) async {
    final result = await _repository.removeItem(itemId: items[index].id);

    result?.fold(
      (error) {
        Utils.showFailSnackBar(error);
      },
      (success) {
        items.removeAt(index);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getItems();
  }
}
