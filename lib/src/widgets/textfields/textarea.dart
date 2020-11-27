///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.textfields.wrapper;

import 'package:flutter/material.dart';

///
/// TextArea
///
class OpenSyTextArea extends StatelessWidget {
  ///
  const OpenSyTextArea({
    @required this.controller,
    this.hintText = '',
    this.hintColor = Colors.grey,
    this.textColor = Colors.black,
    this.fontFamily = 'Roboto',
    this.filled = true,
    this.filledColor = const Color(0xFFE0E0E0),
    this.gesture,
    this.fontSize = 18,
    this.readonly = false,
    this.obscure = false,
    this.onchanged,
  });

  ///
  final String hintText;

  ///
  final Color hintColor;

  ///
  final Color filledColor;

  ///
  final String fontFamily;

  ///
  final TextEditingController controller;

  ///
  final Color textColor;

  ///
  final void Function(String) onchanged;

  ///
  final void Function() gesture;

  ///
  final bool filled;

  ///
  final bool readonly;

  ///
  final bool obscure;

  ///
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      fillColor: filledColor,
      filled: filled,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: hintColor),
      border: InputBorder.none,
    );

    return TextField(
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: textColor,
      ),
      obscureText: obscure,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      readOnly: readonly,
      onTap: gesture ?? () {},
      onChanged: onchanged ?? (_) {},
      controller: controller,
      decoration: decoration,
    );
  }
}
