import 'infrastructure/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infrastructure/routes/route_path.dart';
import 'localization_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePath.loading,
      getPages: RoutePages.pages,
      locale: const Locale('fa', 'IR'),
      translationsKeys: LocalizationService.keys,
    );
  }
}
