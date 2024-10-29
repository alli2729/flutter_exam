import 'route_path.dart';

class RouteNames {
  static const String loading = RoutePath.loading;
  static const String login = RoutePath.login;
  static const String register = '${RoutePath.login}${RoutePath.register}';
  static const String category = RoutePath.category;
  static const String title = '${RoutePath.category}${RoutePath.title}';
  static const String addCategory =
      '${RoutePath.category}${RoutePath.addCategory}';
  static const String addItem =
      '${RoutePath.category}${RoutePath.title}${RoutePath.addItem}';
  static const String editItem =
      '${RoutePath.category}${RoutePath.title}${RoutePath.editItem}';
}
