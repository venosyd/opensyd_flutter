///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.text.dashline;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';
import 'firacodetext.dart';

///
///
///
class DashLine extends StatelessWidget {
  ///
  const DashLine({
    this.straight = false,
    this.color = Colors.black,
    this.extension = 128,
  });

  ///
  final bool straight;

  ///
  final Color color;

  ///
  final int extension;

  @override
  Widget build(BuildContext context) => straight
      //
      ? Text(
          '|\n' * extension,
          style: TextStyle(color: color),
        ).Width(8)
      //
      : FiraCodeText(
          '-' * extension,
          selectable: false,
          center: true,
          color: color,
        ).Height(16);
}
