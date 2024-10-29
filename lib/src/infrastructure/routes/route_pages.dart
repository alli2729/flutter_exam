import '../../pages/register/common/register_bindings.dart';
import '../../pages/register/views/register_view.dart';
import '../../pages/login/common/login_bindings.dart';
import '../../pages/login/views/login_view.dart';
import '../../pages/splash/common/splash_bindings.dart';
import '../../pages/splash/views/splash_view.dart';
import '../../pages/edit_item/common/edit_item_bindings.dart';
import '../../pages/edit_item/views/edit_item_view.dart';
import '../../pages/add_item/common/add_item_bindings.dart';
import '../../pages/add_category/common/add_category_bindings.dart';
import '../../pages/add_category/views/add_category_view.dart';
import '../../pages/add_item/views/add_item_view.dart';
import '../../pages/category/common/category_bindings.dart';
import '../../pages/category/views/category_view.dart';
import '../../pages/title/common/title_bindings.dart';
import '../../pages/title/views/title_view.dart';
import 'package:get/get.dart';
import 'route_path.dart';

class RoutePages {
  static List<GetPage> pages = [
    //* Splash
    GetPage(
      name: RoutePath.loading,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    //* Login
    GetPage(
        name: RoutePath.login,
        page: () => const LoginView(),
        binding: LoginBindings(),
        children: [
          //* Register
          GetPage(
            name: RoutePath.register,
            page: () => const RegisterView(),
            binding: RegisterBindings(),
          )
        ]),
    //* category (HOME)
    GetPage(
      name: RoutePath.category,
      page: () => const CategoryView(),
      binding: CategoryBindings(),
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
        //* add Category
        GetPage(
          name: RoutePath.addCategory,
          page: () => const AddCategoryView(),
          binding: AddCategoryBindings(),
        )
      ],
    ),
  ];
}
