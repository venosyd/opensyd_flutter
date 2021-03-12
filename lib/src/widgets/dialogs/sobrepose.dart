///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.sobrepose;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';
import 'basicdialog.dart';

///
///
///
class SobreposeDialog extends StatelessWidget {
  ///
  const SobreposeDialog({
    this.width = 300,
    this.height = 400,
    this.padding = const EdgeInsets.all(12),
    this.color = Colors.white,
    this.background,
    this.functions = const [OK],
    this.child = const Text('Diálogo'),
  });

  ///
  final double width;

  ///
  final double height;

  ///
  final Color color;

  ///
  final Color background;

  ///
  final Widget child;

  ///
  final EdgeInsets padding;

  ///

  final List<Map<String, dynamic>> functions;

  ///
  static const CANCEL = <String, dynamic>{'title': 'CANCELAR'};

  ///
  static const BACK = <String, dynamic>{'title': 'VOLTAR'};

  ///
  static const OK = <String, dynamic>{'title': 'OK'};

  ///
  static const BorderRadius ROUNDED_BORDER = BorderRadius.only(
    bottomLeft: Radius.elliptical(24, 12),
    bottomRight: Radius.elliptical(24, 12),
  );

  @override
  Widget build(BuildContext context) => OpenSyBasicDialog(
        width: width,
        height: height,
        padding: const EdgeInsets.all(0),
        color: background ?? const Color(0xFFEEEEEE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //
            Padding(padding: padding, child: child)
                .Colored(background ?? Colors.white)
                .Rounded(ROUNDED_BORDER)
                .Sizedbox(width: width, height: height - 36)
                .Scrollable()
                .Expanded(),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                for (Map<String, dynamic> function in functions)
                  //
                  Text(
                    (function['title'] as String) ?? ' ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (function['color'] as Color) ??
                          const Color(0xFF757575),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ) //
                      .Padding(all: 8)
                      .Ripplefy(
                        action: (function['action'] as Function()) ??
                            () => Navigator.pop(context),
                      )
                      .CircularRounded(32)
                      .Expanded(),
              ],
            ).Height(36),
          ],
        ),
      );
}
