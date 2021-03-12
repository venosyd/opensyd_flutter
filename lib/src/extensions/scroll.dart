///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.scroll;

import 'package:flutter/material.dart' as flutter;

///
/// Extensoes comodas para diminuir o callback hell
///
extension OpenSyScroll on flutter.Widget {
  ///
  flutter.Widget Scrollable({
    bool scrollbar = false,
    flutter.Axis direction = flutter.Axis.vertical,
    flutter.EdgeInsets padding = const flutter.EdgeInsets.all(0),
  }) =>
      scrollbar
          //
          ? flutter.Scrollbar(
              child: flutter.SingleChildScrollView(
                padding: padding,
                scrollDirection: direction,
                child: this,
              ),
            )
          //
          : flutter.SingleChildScrollView(
              padding: padding,
              scrollDirection: direction,
              child: this,
            );
}
