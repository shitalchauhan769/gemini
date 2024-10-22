import 'package:gemini/screen/home/controller/home_controller.dart';
import 'package:gemini/util/app_routes.dart';
import 'package:gemini/util/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HomeController controller = Get.put(HomeController());
  controller.getThemeData();
  runApp(
    Obx(
      () =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
        theme: controller.theme.value == false ? lightTheme: darkTheme,
      ),
    ),
  );
}
