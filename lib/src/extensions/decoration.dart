///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.decoration;

import 'package:flutter/material.dart' as flutter;
import 'package:flutter_cursor/flutter_cursor.dart';

import '../widgets/_module_.dart';

///
/// Extensoes comodas para diminuir o callback hell
///
extension OpenSyDecoration on flutter.Widget {
  ///
  flutter.Widget Clickable() => HoverCursor(
        cursor: Cursor.pointer,
        child: this,
      );

  ///
  flutter.Widget Colored(flutter.Color color) => flutter.Container(
        color: color,
        child: this,
      );

  ///
  flutter.Widget Rounded([
    flutter.BorderRadius border = const flutter.BorderRadius.all(
      flutter.Radius.circular(24),
    ),
  ]) =>
      flutter.ClipRRect(
        borderRadius: border,
        child: this,
      );

  ///
  flutter.Widget CircularRounded([double radius = 8.0]) => flutter.ClipRRect(
        borderRadius: flutter.BorderRadius.all(flutter.Radius.circular(radius)),
        child: this,
      );

  ///
  flutter.Widget Elevation({
    double elevation = 2.0,
    flutter.Color background,
    flutter.BorderRadius border,
    void Function() action,
  }) =>
      flutter.Material(
        elevation: elevation,
        color: background,
        borderRadius: border ?? flutter.BorderRadius.circular(0),
        child: flutter.InkWell(
          onTap: action,
          child: this,
        ),
      );

  ///
  flutter.Widget Ripplefy({
    flutter.Color color = flutter.Colors.transparent,
    flutter.BorderRadius border,
    double elevation = 0,
    void Function() action,
  }) =>
      flutter.Material(
        color: color,
        elevation: elevation,
        borderRadius: border ?? flutter.BorderRadius.circular(0),
        child: flutter.InkWell(
          onTap: action,
          child: this,
        ),
      );

  ///
  flutter.Widget Blur() => Glazed(child: this);
}
