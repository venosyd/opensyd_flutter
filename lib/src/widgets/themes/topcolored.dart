///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.themes.topcolored;

import 'package:flutter/material.dart';

import 'apply.dart';

///
///
///
class TopColored extends StatelessWidget {
  ///
  const TopColored({
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
        statusColor: color,
        navigationColor: Colors.white,
        whiteStatusForeground: whiteforeground,
        whiteNavigationForeground: false,
        isdesktop: isdesktop,
      );
}
