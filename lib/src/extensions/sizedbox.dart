///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.sizedbox;

import 'package:flutter/material.dart' as flutter;

///
/// Extensoes comodas para diminuir o callback hell
///
extension OpenSyZedboxes on flutter.Widget {
  ///
  flutter.Widget Expanded([int flex = 1]) => flutter.Expanded(
        flex: flex,
        child: this,
      );

  ///
  flutter.Widget Box(double size) => flutter.SizedBox(
        height: size,
        width: size,
        child: this,
      );

  ///
  flutter.Widget FillScreen(flutter.BuildContext context) => flutter.SizedBox(
        width: flutter.MediaQuery.of(context).size.width,
        height: flutter.MediaQuery.of(context).size.height,
        child: this,
      );

  ///
  flutter.Widget FillBox() => flutter.SizedBox.expand(child: this);

  ///
  flutter.Widget Height(double height) => flutter.SizedBox(
        height: height,
        child: this,
      );

  ///
  flutter.Widget Width(double width) => flutter.SizedBox(
        width: width,
        child: this,
      );

  ///
  flutter.Widget Sizedbox({
    double width,
    double height,
  }) {
    if (width == null) {
      return (height == null)
          ? flutter.SizedBox.expand(child: this)
          : flutter.SizedBox(height: height, child: this);
    } else
      return (height == null)
          ? flutter.SizedBox(width: width, child: this)
          : flutter.SizedBox(width: width, height: height, child: this);
  }
}
