import 'package:get/get.dart';
import '../../pages/catagory/models/catagory_model.dart';
import 'item.dart';

class Database {
  // Variable
  static RxList<CatagoryModel> catagories = RxList([
    CatagoryModel(
      title: 'title 1',
      items: [
        Item(name: 'pizza', price: 12000),
        Item(name: 'hot dog', price: 12000),
      ].obs,
    )
  ]);
  // Constractor

  // Methods
}
