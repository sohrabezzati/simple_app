import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static final Styles instance = Styles._();
  factory Styles() => instance;

  TextStyle textHeadLinLarg({Color? color}) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);
  TextStyle textHeadLinMedium({Color? color}) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color);
  TextStyle textHeadLinSmall({Color? color}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color);
  TextStyle textBodyMedium({Color? color}) =>
      TextStyle(fontSize: 16, color: color);
  TextStyle textBodySmall({Color? color}) =>
      TextStyle(fontSize: 14, color: color);
  TextStyle textCaption({Color? color}) =>
      TextStyle(fontSize: 12, color: color);
}
