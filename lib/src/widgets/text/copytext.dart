///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.text.copytext;

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions/_module_.dart';
import '../dialogs/_module_.dart';

///
///
///
class CopyText extends StatefulWidget {
  ///
  const CopyText(
    this.text, {
    this.fontfamily = 'Roboto',
    this.bold = false,
    this.center = false,
    this.size = 14,
    this.right = false,
    this.underline = false,
    this.linethrough = false,
    this.uppercase = true,
    this.color = Colors.black,
  });

  ///
  final String text;

  ///
  final String fontfamily;

  ///
  final bool underline;

  ///
  final bool linethrough;

  ///
  final bool bold;

  ///
  final bool center;

  ///
  final bool right;

  ///
  final bool uppercase;

  ///
  final double size;

  ///
  final Color color;

  @override
  _CopyTextState createState() => _CopyTextState();
}

///
class _CopyTextState extends State<CopyText>
    with SingleTickerProviderStateMixin {
  ///
  AnimationController controller;

  //
  Animation animation;

  ///
  Color color;

  @override
  void initState() {
    super.initState();

    color = widget.color;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animation = ColorTween(
      begin: Colors.blue,
      end: widget.color,
    ).animate(controller);

    animation.addListener(() {
      setState(() {
        color = animation.value as Color;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          //
          Text(
            widget.text,
            overflow: TextOverflow.clip,
            //
            textAlign: widget.center
                ? TextAlign.center
                : widget.right
                    ? TextAlign.right
                    : TextAlign.left,
            style: TextStyle(
              color: color,
              //
              decoration: widget.underline
                  ? TextDecoration.underline
                  : widget.linethrough
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
              fontFamily: widget.fontfamily,
              //
              fontWeight: widget.bold //
                  ? FontWeight.bold
                  : FontWeight.normal,
              //
              fontSize: widget.size,
            ),
          ).Expanded(),
          //
          FaIcon(
            FontAwesomeIcons.copy,
            size: 14,
            color: widget.color,
          ) //
              .Padding(all: 2)
              .Margin(all: 2)
              .Ripplefy(action: () => _copy(context))
              .CircularRounded(),
        ],
      );

  ///
  void _copy(BuildContext context) {
    FlutterClipboard.copy(widget.text);
    controller.forward(from: 0.0);

    OpenSyDialogs.showSnackbar(
      context: context,
      message: 'Copiado para a Área de transferência!',
    );
  }
}
