///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.padding;

import 'package:flutter/material.dart' as flutter;

///
/// Extensoes comodas para diminuir o callback hell
///
extension OpenSyPadding on flutter.Widget {
  ///
  flutter.Widget Padding({
    double all,
    double horizontal,
    double vertical,
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    if (horizontal != null) {
      left = horizontal;
      right = horizontal;
    }

    if (vertical != null) {
      top = vertical;
      bottom = vertical;
    }

    if (all != null) {
      top = all;
      bottom = all;
      left = all;
      right = all;
    }

    return flutter.Container(
      padding: flutter.EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  ///
  flutter.Widget Margin({
    double all,
    double horizontal,
    double vertical,
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    if (horizontal != null) {
      left = horizontal;
      right = horizontal;
    }

    if (vertical != null) {
      top = vertical;
      bottom = vertical;
    }

    if (all != null) {
      top = all;
      bottom = all;
      left = all;
      right = all;
    }

    return flutter.Container(
      margin: flutter.EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}
