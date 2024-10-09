import 'route_path.dart';

class RouteNames {
  static const String loading = RoutePath.loading;
  static const String login = RoutePath.login;
  static const String register = '${RoutePath.login}${RoutePath.register}';
  static const String catagory = RoutePath.catagory;
  static const String title = '${RoutePath.catagory}${RoutePath.title}';
  static const String addCatagory =
      '${RoutePath.catagory}${RoutePath.addCatagory}';
  static const String addItem =
      '${RoutePath.catagory}${RoutePath.title}${RoutePath.addItem}';
  static const String editItem =
      '${RoutePath.catagory}${RoutePath.title}${RoutePath.editItem}';
}
