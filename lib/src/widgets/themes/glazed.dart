///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.glazed;

import 'dart:ui';

import 'package:flutter/material.dart';

///
///
///
class Glazed extends StatelessWidget {
  ///
  const Glazed({
    @required this.child,
    this.factor = 3,
  });

  ///
  final Widget child;

  ///
  final double factor;

  @override
  Widget build(BuildContext context) => ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: factor,
            sigmaY: factor,
          ),
          child: child,
        ),
      );
}
