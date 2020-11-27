///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widget.loaders.circularoader;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';

///
///
///
class CircularLoader extends StatelessWidget {
  ///
  const CircularLoader({
    this.background = Colors.transparent,
    this.foreground = Colors.blue,
    this.width,
    this.height,
    this.message,
  });

  ///
  final Color background;

  ///
  final Color foreground;

  ///
  final double width;

  ///
  final double height;

  ///
  final String message;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          CircularProgressIndicator(
            backgroundColor: background,
            valueColor: AlwaysStoppedAnimation<Color>(foreground),
          ),
          //
          if (message != null && message.isNotEmpty) const SizedBox(height: 24),
          //
          if (message != null && message.isNotEmpty)
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: foreground,
                fontSize: 12,
              ),
            ),
        ],
      ) //
          .Centered()
          .Padding(all: 8);
}
