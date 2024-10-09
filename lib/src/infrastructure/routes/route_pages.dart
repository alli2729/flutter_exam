import 'package:exam/src/pages/home/common/home_bindings.dart';
import 'package:exam/src/pages/home/views/home_view.dart';
import 'package:get/get.dart';
import 'route_path.dart';

class RoutePages {
  static List<GetPage> pages = [
    //*
    GetPage(
      name: RoutePath.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
  ];
}
