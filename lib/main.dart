import 'package:biz/routes.dart';
import 'package:biz/service_locator.dart';
import 'package:biz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      checkerboardOffscreenLayers: false,
      title: 'BIZ',
      theme: ThemeData(
        // ignore: deprecated_member_use
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        primarySwatch: appBarColorSwatch,
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
      ),
      initialRoute: NamedRoutes.routeLogin,
      getPages: Routes.pages,
    );
  }
}
