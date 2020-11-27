///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.themes.allcolored;

import 'package:flutter/material.dart';

import 'apply.dart';

///
///
///
class AllColored extends StatelessWidget {
  ///
  const AllColored({
    @required this.child,
    @required this.color,
    this.whiteforeground = false,
    this.isdesktop = false,
  });

  ///
  final Widget child;

  ///
  final Color color;

  ///
  final bool whiteforeground;

  ///
  final bool isdesktop;

  @override
  Widget build(BuildContext context) => ApplyTheme(
        child: child,
        navigationColor: color,
        statusColor: color,
        whiteStatusForeground: whiteforeground,
        whiteNavigationForeground: whiteforeground,
        isdesktop: isdesktop,
      );
}
