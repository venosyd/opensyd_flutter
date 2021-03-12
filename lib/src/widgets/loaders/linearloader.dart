///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widget.loaders.linearoader;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';

///
///
///
class LinearLoader extends StatelessWidget {
  ///
  const LinearLoader({
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
          LinearProgressIndicator(
            backgroundColor: background,
            valueColor: AlwaysStoppedAnimation<Color>(foreground),
          ),
          //
          if (message != null && message.isNotEmpty) const SizedBox(height: 12),
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
