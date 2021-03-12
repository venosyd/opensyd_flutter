///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.themes.allwhite;

import 'package:flutter/material.dart';

import 'apply.dart';

///
///
///
class AllWhiteTheme extends StatelessWidget {
  ///
  const AllWhiteTheme({
    this.child,
    this.isdesktop = false,
  });

  ///
  final Widget child;

  ///
  final bool isdesktop;

  @override
  Widget build(BuildContext context) => ApplyTheme(
        child: child,
        navigationColor: Colors.white,
        statusColor: Colors.white,
        whiteStatusForeground: false,
        whiteNavigationForeground: false,
        isdesktop: isdesktop,
      );
}
