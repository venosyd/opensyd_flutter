///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widget.bars.emptyappbar;

import 'package:flutter/material.dart';

///
///
///
class EmptyAppBar extends AppBar {
  EmptyAppBar({
    Color color = Colors.transparent,
  }) : super(
          elevation: 0,
          backgroundColor: color,
        );

  @override
  Size get preferredSize => Size(super.preferredSize.width, 0.0);
}
