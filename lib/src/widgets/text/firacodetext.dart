///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.text.firacode;

import 'package:flutter/material.dart';

///
///
///
class FiraCodeText extends StatelessWidget {
  ///
  const FiraCodeText(
    this.text, {
    this.bold = false,
    this.center = false,
    this.small = false,
    this.big = false,
    this.immense = false,
    this.right = false,
    this.selectable = true,
    this.underline = false,
    this.linethrough = false,
    this.uppercase = true,
    this.color = Colors.black,
  });

  ///
  final String text;

  ///
  final bool underline;

  ///
  final bool linethrough;

  ///
  final bool bold;

  ///
  final bool center;

  ///
  final bool right;

  ///
  final bool small;

  ///
  final bool big;

  ///
  final bool immense;

  ///
  final bool selectable;

  ///
  final bool uppercase;

  ///
  final Color color;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: color,
      decoration: underline
          ? TextDecoration.underline
          : (linethrough ? TextDecoration.lineThrough : TextDecoration.none),
      fontFamily: 'Fira Code',
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: small ? 12 : (immense ? 36 : (big ? 18 : 14)),
    );

    final align =
        center ? TextAlign.center : (right ? TextAlign.right : TextAlign.left);

    final widget = selectable
        //
        ? SelectableText(
            uppercase ? text.toUpperCase() : text,
            textAlign: align,
            style: style,
          )
        //
        : Text(
            uppercase ? text.toUpperCase() : text,
            textAlign: align,
            overflow: TextOverflow.clip,
            style: style,
          );

    return widget;
  }
}
