import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:get/state_manager.dart';

class ButtonContoller extends GetxController {
  int count = 0;
  List exp = [].obs;
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  String exprsn = "";
  bool answershown = false;
  var valuetoDisp = "".obs;
  buttonFinder(int indx, s) {
    if (indx == 0) {
      clear();
    } else if (indx == 1) {
      changesign();
    } else if (indx == 3) {
      delete();
    } else if (indx == 17) {
      dotchecker(s);
    } else {
      numberorop(s);
    }
  }

  clrdisp() {
    valuetoDisp.value = "";
  }

  clear() {
    valuetoDisp.value = "";
    exp.clear();
  }

  delete() {
    if (valuetoDisp.value != "") {
      valuetoDisp.value =
          valuetoDisp.value.substring(0, valuetoDisp.value.length - 1);
      if (valuetoDisp.value == ""&&exp.isNotEmpty) {
        if (!prvChkr(exp.last)) {
          valuetoDisp.value = exp.last.toString();
          exp.removeLast();
        }
      }
    } else if (exp.isNotEmpty) {
      if (prvChkr(exp.last)) {
        exp.removeLast();
        valuetoDisp.value = exp.last.toString();
        exp.removeLast();
      } else {
        exp.removeLast();
      }
    }
  }

  dotchecker(s) {
    if (valuetoDisp.value == "") {
      valuetoDisp.value = "0.";
    } else {
      valuetoDisp.value.contains(".")
          ? valuetoDisp.value = valuetoDisp.value
          : valuetoDisp.value = valuetoDisp.value + s;
    }
  }

  changesign() {
    valuetoDisp.value.startsWith('-')
        ? valuetoDisp.value = valuetoDisp.value.substring(1)
        : valuetoDisp.value = "-" + valuetoDisp.value;
  }

  numberorop(s) {
    if (s != "1" &&
        s != "2" &&
        s != "3" &&
        s != "4" &&
        s != "5" &&
        s != "6" &&
        s != "7" &&
        s != "8" &&
        s != "9" &&
        s != "0" &&
        s != "pi") {
      if (s != "=") {
        answershown = false;
      }
      if (exp.isEmpty && valuetoDisp.value != "" && s != "=") {
        exp.add(valuetoDisp.value);
        exp.add(s);
        clrdisp();
      } else if (exp.isNotEmpty && valuetoDisp.value == "" && s != "=") {
        exp.removeLast();
        exp.add(s);
      } else if (s == "=" && valuetoDisp.value != "") {
        if (exp.isNotEmpty) {
          bool isPrevOp = prvChkr(exp.last);
          if (isPrevOp) {
            exp.add(valuetoDisp.value);
            calculate();
          }
        } else {
          exp.add(valuetoDisp.value);
          calculate();
        }
      } else {
        if (exp.isNotEmpty) {
          bool isPrevOp = prvChkr(exp.last);
          if (isPrevOp) {
            if (valuetoDisp.value != "") {
              exp.add(valuetoDisp.value);
              exp.add(s);
              clrdisp();
            } else {
              if (s == "=") {
                exp.removeLast();
                calculate();
              }
            }
          } else {
            exp.clear();
            exp.add(valuetoDisp.value);
            exp.add(s);
            clrdisp();
          }
        } else {
          print("elsee");
        }
      }
    } else {
      if (s == "pi") {
        if (valuetoDisp.value == "" || valuetoDisp.value == "-") {
          valuetoDisp.value = valuetoDisp.value + s;
        }
      } else {
        if (valuetoDisp.value.contains("pi")) {
          exp.add(valuetoDisp.value);
          exp.add("\u00d7");
          clrdisp();
        }
        if (answershown) {
          answershown = false;
          clear();
        }
        valuetoDisp.value = valuetoDisp.value + s;
      }
    }
    print("the sym  $s");
  }

  prvChkr(s) {
    if (s == "\u00d7" || s == "÷" || s == "+" || s == "-" || s == "=") {
      return true;
    }
    return false;
  }

  calculate() {
    String s = exp
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(",", "")
        .replaceAll("÷", "/")
        .replaceAll("\u00d7", "*");

    print(exp
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(",", "")
        .replaceAll("÷", "/"));
    if (s == "") s = "0";
    try {
      valuetoDisp.value =
          removeTrailingZerosAndNumberfy(s.interpret().toStringAsFixed(10))
              .toString();
      answershown = true;
    } catch (e) {
      print("String is $s and error = $s");
    }
    print(" the Ans  ${s} ");
  }

  TextStyle? fontResize(context) {
    if (valuetoDisp.value.length < 13) {
      print("Fnt 1");
      return Theme.of(context).textTheme.headline1;
    } else if (valuetoDisp.value.length < 16) {
      print("Fnt 2");

      return Theme.of(context).textTheme.headline2;
    } else if (valuetoDisp.value.length < 20) {
      print("Fnt 3");

      return Theme.of(context).textTheme.headline3;
    } else if (valuetoDisp.value.length < 24) {
      print("Fnt 4");

      return Theme.of(context).textTheme.headline4;
    } else if (valuetoDisp.value.length < 30) {
      print("Fnt 4");

      return Theme.of(context).textTheme.headline5;
    }
  }

  removeTrailingZerosAndNumberfy(String n) {
    if (n.contains('.')) {
      return double.parse(n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"),
              "") //remove all trailing 0's and extra decimals at end if any
          );
    } else {
      return double.parse(n);
    }
  }
}
