///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.buttons.sybutton;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';

///
///
///
class OpenSyButton extends StatelessWidget {
  ///
  const OpenSyButton({
    @required this.text,
    @required this.action,
    this.foreground = const Color(0xFF424242),
    this.background = Colors.transparent,
    this.fontsize = 14,
    this.fontfamily,
    this.padding = 16,
    this.radius = 4,
    this.bold = true,
  });

  ///
  final String text;

  ///
  final String fontfamily;

  ///
  final Color foreground;

  ///
  final Color background;

  ///
  final double fontsize;

  ///
  final double padding;

  ///
  final double radius;

  ///
  final bool bold;

  ///
  final void Function() action;

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: foreground,
          fontFamily: fontfamily,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontsize,
        ),
      ) //
          .Centered()
          .Padding(horizontal: padding)
          .Ripplefy(
            color: background,
            action: action ?? () {},
          )
          .CircularRounded(radius);
}
