import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neucal/controllers/themecontroller.dart';

import 'constants/themes/app_theme.dart';
import 'screeens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final aceController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: aceController.themeMod.value == Brightness.light
            ? AppTheme.lightTheme
            : AppTheme.darkTheme,
        home: const HomeScreen()));
  }
}
