///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.buttons.syiconbutton;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';

///
///
///
class OpenSyIconButton extends StatelessWidget {
  ///
  const OpenSyIconButton({
    @required this.action,
    @required this.icon,
    this.text,
    this.foreground = const Color(0xFF424242),
    this.background = Colors.transparent,
    this.iconsize = 16,
    this.fontsize = 14,
    this.fontfamily,
    this.padding = 16,
    this.radius = 4,
    this.bold = true,
    this.inverted = false,
  });

  ///
  final IconData icon;

  ///
  final String text;

  ///
  final String fontfamily;

  ///
  final Color foreground;

  ///
  final Color background;

  ///
  final double fontsize;

  ///
  final double iconsize;

  ///
  final double padding;

  ///
  final double radius;

  ///
  final bool bold;

  ///
  final bool inverted;

  ///
  final void Function() action;

  @override
  Widget build(BuildContext context) => (text != null
          // icone e texto
          ? inverted
              // invertido (texto primeiro)
              ? Row(
                  children: [
                    //
                    _OpenSyIconButtonText(
                      text: text,
                      fontfamily: fontfamily,
                      bold: bold,
                      fontsize: fontsize,
                      foreground: foreground,
                    ).Margin(left: 8, right: 12),
                    //
                    Icon(icon, size: iconsize, color: foreground) //
                        .Margin(right: 8),
                  ],
                )
              // padrao (icone, depois texto)
              : Row(
                  children: [
                    //
                    Icon(icon, size: iconsize, color: foreground) //
                        .Margin(left: 8, right: 12),
                    //
                    _OpenSyIconButtonText(
                      text: text,
                      fontfamily: fontfamily,
                      bold: bold,
                      fontsize: fontsize,
                      foreground: foreground,
                    ).Margin(right: 8),
                  ],
                )
          // apenas icone
          : Icon(icon, size: iconsize, color: foreground))
      .Centered()
      .Padding(horizontal: padding)
      .Ripplefy(
        color: background,
        action: action ?? () {},
      )
      .CircularRounded(radius);
}

///
///
///
class _OpenSyIconButtonText extends StatelessWidget {
  ///
  const _OpenSyIconButtonText({
    this.text,
    this.fontfamily,
    this.foreground,
    this.bold,
    this.fontsize,
  });

  ///
  final String text;

  ///
  final String fontfamily;

  ///
  final Color foreground;

  ///
  final bool bold;

  ///
  final double fontsize;

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: foreground,
          fontFamily: fontfamily,
          fontWeight: bold //
              ? FontWeight.bold
              : FontWeight.normal,
          fontSize: fontsize,
        ),
      );
}
