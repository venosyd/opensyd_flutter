///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.border;

import 'package:flutter/material.dart' as flutter;

///
/// Extensoes comodas para diminuir o callback hell
///
extension OpenSyBorders on flutter.Widget {
  ///
  flutter.Widget BorderAll({
    double width = 1,
    flutter.Color color = flutter.Colors.black,
  }) =>
      flutter.Container(
        decoration: flutter.BoxDecoration(
            border: flutter.Border.all(color: color, width: width)),
        child: this,
      );

  ///
  flutter.Widget BorderBottom({
    double width = 1,
    flutter.Color color = flutter.Colors.black,
  }) =>
      flutter.Container(
        decoration: flutter.BoxDecoration(
          border: flutter.Border(
            bottom: flutter.BorderSide(
              color: color,
              width: width,
            ),
          ),
        ),
        child: this,
      );

  ///
  flutter.Widget Border({
    flutter.BorderSide top = flutter.BorderSide.none,
    flutter.BorderSide bottom = flutter.BorderSide.none,
    flutter.BorderSide left = flutter.BorderSide.none,
    flutter.BorderSide right = flutter.BorderSide.none,
  }) =>
      flutter.Container(
        decoration: flutter.BoxDecoration(
          border: flutter.Border(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ),
        ),
        child: this,
      );
}
