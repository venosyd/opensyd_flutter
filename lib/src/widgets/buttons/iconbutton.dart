///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.buttons.syiconbutton;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions/_module_.dart';

///
///
///
class OpenSyIconButton extends StatelessWidget {
  ///
  const OpenSyIconButton({
    @required this.action,
    this.icon,
    this.text,
    this.size = 18,
    this.foreground = Colors.grey,
    this.background = Colors.transparent,
    this.inverted = false,
  });

  ///
  final IconData icon;

  ///
  final double size;

  ///
  final Color foreground;

  ///
  final Color background;

  ///
  final String text;

  ///
  final bool inverted;

  ///
  final void Function() action;

  @override
  Widget build(BuildContext context) => (icon != null
          // se tiver icone
          ? (text != null
              // icone e texto
              ? inverted
                  // invertido
                  ? Row(
                      children: [
                        //
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: foreground),
                        ).Margin(left: 8, right: 12),
                        //
                        FaIcon(icon, size: size, color: foreground) //
                            .Margin(right: 8),
                      ],
                    )
                  // padrao
                  : Row(
                      children: [
                        //
                        FaIcon(icon, size: size, color: foreground) //
                            .Margin(left: 8, right: 12),
                        //
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: foreground),
                        ).Margin(right: 8),
                      ],
                    )
              // apenas icone
              : FaIcon(icon, size: size, color: foreground))
          // apenas texto
          : Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: foreground),
            ))
      .Centered()
      .Padding(vertical: 8, horizontal: 12)
      .Ripplefy(action: action, color: background)
      .CircularRounded(32);
}
