import 'infrastructure/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infrastructure/routes/route_path.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePath.catagory,
      getPages: RoutePages.pages,
    );
  }
}
