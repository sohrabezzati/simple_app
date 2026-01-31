import 'package:flutter/material.dart';

class GlobalKeys {
  GlobalKeys._();
  static final GlobalKeys instance = GlobalKeys._();
  factory GlobalKeys() => instance;

   GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
   GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
}
