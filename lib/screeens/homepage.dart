import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:neucal/constants/themes/app_theme.dart';
import 'package:neucal/controllers/button__contoller.dart';
import 'package:neucal/controllers/themecontroller.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final aceController = Get.put(ThemeController());
    final displayContoller = Get.put(ButtonContoller());

    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: GestureDetector(
            onTap: () {
              aceController.launchURL();
              Navigator.of(context).pop();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: const Center(
                    child: RiveAnimation.asset(
                      "assets/1851-3677-falsepetigif.riv",
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Tap to Report'),
                      TextSpan(
                          text: ' Bugs\n',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.apply(color: AppTheme.priceColor)),
                      const TextSpan(
                        text: '©',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: "abh1ram",
                          style: Theme.of(context).textTheme.button),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("calculator", style: Theme.of(context).textTheme.subtitle1),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child:  Container(
              alignment: Alignment.center,
              color: Theme.of(context).backgroundColor,
              child: const FaIcon(
                FontAwesomeIcons.alignLeft,
                size: 20,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (aceController.themeMod.value == Brightness.light) {
                aceController.themeMod.value = Brightness.dark;
              } else {
                aceController.themeMod.value = Brightness.light;
              }
            },
            child: Container(
              
              alignment: Alignment.center,
              color: Theme.of(context).backgroundColor,
              padding: const EdgeInsets.only(right: 20),
                child: FaIcon(
                  aceController.themeMod.value == Brightness.light
                      ? FontAwesomeIcons.moon
                      : FontAwesomeIcons.sun,
                  size: 20,
                )),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: aceController.themeMod.value == Brightness.light
                        ? AppTheme.lightOuterboxCol
                        : AppTheme.darkouterboxCol,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 45,
                    height: MediaQuery.of(context).size.height * 0.25 - 26,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: aceController.themeMod.value ==
                                      Brightness.light
                                  ? AppTheme.lightAccentColor
                                  : AppTheme.darkAccentColor,
                              blurRadius: 10,
                              spreadRadius: 10)
                        ]),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                    ),
                    child: Obx(() => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: displayContoller.exp.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 20),
                              height: 50,
                              child: Text(
                                displayContoller.exp.elementAt(
                                    displayContoller.exp.length - 1 - index),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.apply(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.5)),
                              ));
                        }))),
                Positioned(
                    bottom: 10,
                    right: 20,
                    left: 10,
                    child: Obx(() => Text(
                          displayContoller.valuetoDisp.value,
                          textAlign: TextAlign.right,
                          style: displayContoller.fontResize(context),
                        )))
              ],
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 10),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        child: Obx(() => Material(
                              borderRadius: BorderRadius.circular(30.8),
                              elevation: 6,
                              child: GestureDetector(
                                onTap: () {
                                  displayContoller.buttonFinder(
                                      index,
                                      aceController.buttontext[index] ??
                                          index.toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: aceController.themeMod.value ==
                                              Brightness.light
                                          ? AppTheme.lightxyzColor
                                          : AppTheme.darkxyzColor),
                                  child: Center(
                                      child: Text(
                                    aceController.buttontext[index] ??
                                        index.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )),
                                ),
                              ),
                            )),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
