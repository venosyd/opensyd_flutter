///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.basicdialog;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';

///
class OpenSyBasicDialog extends StatelessWidget {
  ///
  const OpenSyBasicDialog({
    this.width = 320,
    this.height = 300,
    this.radius = 16,
    this.color = Colors.white,
    this.padding = const EdgeInsets.fromLTRB(24, 24, 24, 8),
    @required this.child,
  });

  ///
  final Widget child;

  ///
  final double width;

  ///
  final double height;

  ///
  final double radius;

  ///
  final Color color;

  ///
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: padding,
          child: child,
        ) //
            .Sizedbox(width: width, height: height)
            .Colored(color)
            .CircularRounded(radius),
      );
}
