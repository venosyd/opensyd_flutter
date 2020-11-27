///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.textfields.wrapper;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions/_module_.dart';
import 'abstract.dart';

///
///
///
class TextFieldWrapper extends StatelessWidget {
  ///
  const TextFieldWrapper({
    this.child,
    this.padding = 12,
    this.eraserContainerColor,
    this.refresh,
    this.functions = const [],
    this.isWhiteEraser = false,
    this.noeraser = false,
  });

  ///
  final AbstractOpenSyTextEdit child;

  ///
  final double padding;

  ///
  final Color eraserContainerColor;

  ///
  final bool isWhiteEraser;

  ///
  final bool noeraser;

  ///
  final Function refresh;

  ///
  final List<Map<String, dynamic>> functions;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          //
          child.Expanded(),
          //
          for (final function in functions)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //
                if (function['icon'] != null)
                  FaIcon(
                    function['icon'] as IconData,
                    size: 16,
                    color: isWhiteEraser ? Colors.white : Colors.grey,
                  ),
                //
                if (function['text'] != null)
                  Text(
                    function['text'] as String,
                    style: const TextStyle(fontSize: 11),
                  ),
              ],
            ) //
                .Centered()
                .Sizedbox(width: 48, height: 40)
                .Ripplefy(action: function['action'] as void Function()),
          //
          if (!noeraser)
            FaIcon(
              FontAwesomeIcons.backspace,
              size: 16,
              color: isWhiteEraser ? Colors.white : Colors.grey,
            ) //
                .Centered()
                .Sizedbox(width: 48, height: 40)
                .Ripplefy(action: _erase),
        ],
      )
          .Colored(eraserContainerColor ?? const Color(0xFFF5F5F5))
          .Padding(all: padding);

  ///
  void _erase() {
    child.controller.text = '';
    if (refresh != null) {
      refresh();
    }
  }
}
