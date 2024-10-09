import '../../pages/edit_item/common/edit_item_bindings.dart';
import '../../pages/edit_item/views/edit_item_view.dart';
import '../../pages/add_item/common/add_item_bindings.dart';
import '../../pages/add_catagory/common/add_catagory_bindings.dart';
import '../../pages/add_catagory/views/add_catagory_view.dart';
import '../../pages/add_item/views/add_item_view.dart';
import '../../pages/catagory/common/catagory_bindings.dart';
import '../../pages/catagory/views/catagory_view.dart';
import '../../pages/title/common/title_bindings.dart';
import '../../pages/title/views/title_view.dart';
import 'package:get/get.dart';
import 'route_path.dart';

class RoutePages {
  static List<GetPage> pages = [
    //* catagory (HOME)
    GetPage(
      name: RoutePath.catagory,
      page: () => const CatagoryView(),
      binding: CatagoryBindings(),
      children: [
        //* Title
        GetPage(
          name: RoutePath.title,
          page: () => const TitleView(),
          binding: TitleBindings(),
          children: [
            //* add Item
            GetPage(
              name: RoutePath.addItem,
              page: () => const AddItemView(),
              binding: AddItemBindings(),
            ),
            //* edit item
            GetPage(
              name: RoutePath.editItem,
              page: () => const EditItemView(),
              binding: EditItemBindings(),
            ),
          ],
        ),
        //* add Catagory
        GetPage(
          name: RoutePath.addCatagory,
          page: () => const AddCatagoryView(),
          binding: AddCatagoryBindings(),
        )
      ],
    ),
  ];
}
