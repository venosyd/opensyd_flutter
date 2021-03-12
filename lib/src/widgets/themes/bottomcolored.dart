///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.themes.bottomcolored;

import 'package:flutter/material.dart';

import 'apply.dart';

///
///
///
class BottomColored extends StatelessWidget {
  ///
  const BottomColored({
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
        statusColor: Colors.white,
        navigationColor: color,
        whiteStatusForeground: false,
        whiteNavigationForeground: whiteforeground,
        isdesktop: isdesktop,
      );
}
