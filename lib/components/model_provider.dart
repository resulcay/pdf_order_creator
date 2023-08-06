import 'package:flutter/material.dart';
import 'package:pdf_order_creator/enums/model_enum.dart';

class ModelProvider extends ChangeNotifier {
  Model model = Model.none;

  changeModel(Model selection) {
    model = selection;
    notifyListeners();
  }
}
