import 'package:flutter/material.dart';
import 'package:pdf_order_creator/enums/color_type_enum.dart';

class ColorTypeProvider extends ChangeNotifier {
  ColorType? colorType;

  changeColor(ColorType? value) {
    colorType = value;
    notifyListeners();
  }
}
