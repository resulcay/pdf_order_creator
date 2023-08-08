import 'package:flutter/material.dart';

class ColorConstants {
  static var primaryColor = Colors.blue[700];
  static const secondaryColor = Colors.grey;
  static const pureWhite = Colors.white;
  static const pureBlack = Colors.black;

  // normal tones
  static const n01White = Color(0xffffffff);
  static const n05White = Color(0xfffdfbfd);
  static const n407Manhattan = Color(0xffebecea);

  static const List<Color> normalTones = [
    n01White,
    n05White,
    n407Manhattan,
  ];
  static const List<String> normalTonesNames = [
    '01 White',
    '05 White',
    '407 Manhattan',
  ];

  // pro tones
  static const p43Black = Color(0xff1d1d1b);
  static const p23Brown = Color(0xff724431);
  static const p27Brown = Color(0xff572e1d);
  static const p15Yellow = Color(0xffffe500);
  static const p17Yellow = Color(0xffd59e05);
  static const p740Orange = Color(0xfff38e3d);
  static const p53Orange = Color(0xffec6707);
  static const p312Green = Color(0xff007337);
  static const p33Blue = Color(0xff22254c);
  static const p571Red = Color(0xffd02628);
  static const List<Color> proTones = [
    p43Black,
    p23Brown,
    p27Brown,
    p15Yellow,
    p17Yellow,
    p740Orange,
    p53Orange,
    p312Green,
    p33Blue,
    p571Red,
  ];
  static const List<String> proTonesNames = [
    '43 Black',
    '23 Brown',
    '27 Brown',
    '15 Yellow',
    '17 Yellow',
    '740 Orange',
    '53 Orange',
    '312 Green',
    '33 Blue',
    '571 Red',
  ];

  // metallic tones.
  static const m101Pearl = Color(0xfff2efed);
  static const mA1356Gold = Color(0xffe1c062);
  static const mA1380Silver = Color(0xff726f6d);

  static const List<Color> metallicTones = [
    m101Pearl,
    mA1356Gold,
    mA1380Silver,
  ];

  static const List<String> metallicTonesNames = [
    '101 Pearl',
    'A-1356 Gold',
    'A-1380 Silver',
  ];
}
