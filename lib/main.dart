import 'package:gemini/util/app_routes.dart';
import 'package:gemini/util/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,

      darkTheme: darkTheme,
      theme: lightTheme,
      // themeMode: ,
    ),
  );
}
