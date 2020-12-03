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
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  ///
  flutter.Widget Fill({
    flutter.BuildContext context,
    double left = 0,
    double top = 0,
    double right,
    double bottom,
  }) {
    if (context != null) {
      final size = flutter.MediaQuery.of(context).size;
      return flutter.Positioned.fill(
        child: flutter.SizedBox(
          child: this,
          width: size.width,
          height: size.height,
        ),
      );
    } else
      return flutter.Positioned.fill(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        child: this,
      );
  }
}
