// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pdf_order_creator/service/path_service.dart';

class LocaleConstants extends PathService {
  static const Locale enLocale = Locale('en', 'US');
  static const Locale deLocale = Locale('de', 'DE');
  static const String TRANSLATION_PATH = "assets/translations";
}
