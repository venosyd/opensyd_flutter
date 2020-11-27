///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.selectors.navegador;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions/_module_.dart';

///
///
///
class Navegador extends StatelessWidget {
  ///
  const Navegador({
    this.first,
    this.back,
    this.next,
    this.last,
    this.current,
  });

  ///
  final void Function() first;

  ///
  final void Function() back;

  ///
  final void Function() next;

  ///
  final void Function() last;

  ///
  final String current;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //
          _BT(FontAwesomeIcons.angleDoubleLeft, first),
          //
          _BT(FontAwesomeIcons.angleLeft, back),
          //
          Text(current, style: const TextStyle(fontWeight: FontWeight.bold))
              .Margin(horizontal: 12),
          //
          _BT(FontAwesomeIcons.angleRight, next),
          //
          _BT(FontAwesomeIcons.angleDoubleRight, last),
        ],
      ) //
          .Sizedbox(height: 54, width: 256)
          .CircularRounded(64);
}

///
///
///
class _BT extends StatelessWidget {
  ///
  const _BT(this.icon, this.action);

  ///
  final IconData icon;

  ///
  final void Function() action;

  @override
  Widget build(BuildContext context) => FaIcon(
        icon,
        size: 20,
        color: Colors.grey,
      ) //
          .Padding(horizontal: 12)
          .Ripplefy(action: action)
          .CircularRounded(64)
          .Margin(horizontal: 12);
}
