///
/// venosyd © 2018, 2019, 2020.
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.themes.tema;

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

///
///
///
abstract class Tema {
  ///
  static Future<bool> setStatusbarColors({
    Color statusColor = Colors.white,
    Color navigationColor = Colors.white,
    bool whiteStatusForeground = false,
    bool whiteNavigationForeground = false,
    bool isdesktop = false,
  }) async {
    if (!isdesktop) {
      await FlutterStatusbarcolor.setStatusBarColor(statusColor);
      await FlutterStatusbarcolor.setStatusBarWhiteForeground(
          whiteStatusForeground);

      await FlutterStatusbarcolor.setNavigationBarColor(navigationColor);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(
          whiteNavigationForeground);
    }

    return true;
  }
}
