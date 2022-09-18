import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _globalKey;

  void controlMenu() {
    bool open = _globalKey.currentState?.isDrawerOpen ?? false;
    if (!open) {
      _globalKey.currentState?.openDrawer();
    } else {
      _globalKey.currentState?.openEndDrawer();
    }
  }
}
