import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemeController extends GetxController {
  var themeMod = Brightness.dark.obs;
  Map buttontext = {
    0: "C",
    1: "+/-",
    2: "pi",
    3: "DEL",
    4: "7",
    5: "8",
    6: "9",
    8: "4",
    9: "5",
    10: "6",
    11:"\u00d7",
    12:"1",
    13:"2",
    14:"3",
    15:"-",
    7: "÷",
    16: "0",
    17: ".",
    18: "=",
    19: "+"
  };
  @override
  void onInit() {
    themeMod.value = SchedulerBinding.instance!.window.platformBrightness;

    super.onInit();
  }
  void launchURL() async {
  if (!await launch("https://abh1ram.web.app/")) throw 'Could not launch l';
}
}
