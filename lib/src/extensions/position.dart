///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.position;

import 'package:flutter/material.dart' as flutter;

///
/// Extensoes comodas para diminuir o callback hell
///
extension OpenSyPosition on flutter.Widget {
  ///
  flutter.Widget Centered() => flutter.Center(child: this);

  ///
  flutter.Widget Positioned({
    double left,
    double top,
    double right,
    double bottom,
    double width,
    double height,
  }) =>
      flutter.Positioned(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  ///
  flutter.Widget Fill({
    double left = 0,
    double top = 0,
    double right,
    double bottom,
  }) =>
      flutter.Positioned.fill(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        child: this,
      );
}
