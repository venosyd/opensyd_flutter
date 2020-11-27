///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.dialog;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';
import 'sobrepose.dart';

///
///
///
class OpenSyDialog extends StatelessWidget {
  ///
  const OpenSyDialog({
    @required this.text,
    this.function,
    this.width = 320,
    this.height = 220,
    this.background = const Color(0xFFEEEEEE),
    this.foreground = const Color(0xFF757575),
  });

  ///
  final String text;

  ///
  final void Function() function;

  ///
  final double width;

  ///
  final double height;

  ///
  final Color background;

  ///
  final Color foreground;

  @override
  Widget build(BuildContext context) => SobreposeDialog(
        width: width,
        height: height,
        background: background,
        functions: [
          <String, dynamic>{
            'title': 'OK',
            'color': foreground,
            'action': () {
              Navigator.pop(context);
              (function ?? () {})();
            },
          }
        ],
        child: SelectableText(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: foreground,
            fontSize: 16,
          ),
        ) //
            .Scrollable()
            .Centered(),
      );
}
