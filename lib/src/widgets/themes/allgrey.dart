///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.themes.allgrey;

import 'package:flutter/material.dart';

import 'apply.dart';

///
///
///
class AllGreyTheme extends StatelessWidget {
  ///
  const AllGreyTheme({
    @required this.child,
    this.isdesktop = false,
  });

  ///
  final Widget child;

  ///
  final bool isdesktop;

  @override
  Widget build(BuildContext context) => ApplyTheme(
        child: child,
        navigationColor: const Color(0xFFF5F5F5),
        statusColor: const Color(0xFFF5F5F5),
        whiteStatusForeground: false,
        whiteNavigationForeground: false,
        isdesktop: isdesktop,
      );
}
