import 'package:flutter/material.dart';
import 'package:pdf_order_creator/home_page.dart';

class ModelProvider extends ChangeNotifier {
  Model model = Model.none;

  changeModel(Model selection) {
    model = selection;
    notifyListeners();
  }
}
