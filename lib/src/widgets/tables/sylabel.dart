///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.table.label;

import 'package:flutter/material.dart';

import '../text/_module_.dart';

///
///
///
class OpenSyLabel extends StatelessWidget {
  ///
  const OpenSyLabel(
    this.text, {
    this.color = Colors.black,
    this.firacode = false,
    this.large = false,
    this.small = false,
    this.center = false,
    this.bold = false,
    this.fontfamily = 'Roboto',
    this.uppercase = true,
    this.selectable = true,
    this.copytext = false,
    this.underline = false,
  });

  ///
  final String text;

  ///
  final String fontfamily;

  ///
  final Color color;

  ///
  final bool firacode;

  ///
  final bool underline;

  ///
  final bool large;

  ///
  final bool small;

  ///
  final bool bold;

  ///
  final bool center;

  ///
  final bool selectable;

  ///
  final bool copytext;

  ///
  final bool uppercase;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: color,
      fontFamily: fontfamily,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontSize: large
          ? 20
          : small
              ? 12
              : 14,
    );

    return firacode
        //
        ? FiraCodeText(
            text ?? '',
            small: small,
            big: large,
            bold: bold,
            color: color,
            center: center,
            selectable: selectable,
            uppercase: uppercase,
          )
        //
        : selectable && !copytext
            //
            ? SelectableText(
                text ?? '',
                textAlign: center ? TextAlign.center : TextAlign.start,
                style: style,
              )
            //
            : copytext
                //
                ? CopyText(
                    text ?? '',
                    size: large
                        ? 20
                        : small
                            ? 12
                            : 14,
                    center: center,
                    bold: bold,
                    fontfamily: firacode ? 'Fira Code' : fontfamily,
                    uppercase: uppercase,
                    underline: underline,
                  )
                //
                : Text(
                    text ?? '',
                    textAlign: center ? TextAlign.center : TextAlign.start,
                    style: style,
                  );
  }
}
