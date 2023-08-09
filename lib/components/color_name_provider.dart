import 'package:flutter/material.dart';
import 'package:pdf_order_creator/constants/color_constants.dart';

class ColorNameProvider extends ChangeNotifier {
  String normalColorName = ColorConstants.normalTonesNames[0];
  String doubleBodyColorName = ColorConstants.proTonesNames[0];
  String doubleFrameColorName = ColorConstants.proTonesNames[0];
  String metallicColorName = ColorConstants.metallicTonesNames[0];

  changeNormalColorName(String value) {
    normalColorName = value;
    notifyListeners();
  }

  changeDoubleBodyColorName(String value) {
    doubleBodyColorName = value;
    notifyListeners();
  }

  changeDoubleFrameColorName(String value) {
    doubleFrameColorName = value;
    notifyListeners();
  }

  changeMetallicColorName(String value) {
    metallicColorName = value;
    notifyListeners();
  }
}
