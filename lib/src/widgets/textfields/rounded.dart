///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.textfields.rounded;

import 'package:flutter/material.dart';

import 'abstract.dart';

///
///
///
class RoundedTextField extends AbstractOpenSyTextEdit {
  ///
  const RoundedTextField({
    @required TextEditingController controller,
    String text = '',
    this.labelColor = Colors.black,
    this.background = const Color(0xFFEEEEEE),
    this.inputType = TextInputType.text,
    //
    void Function(String) onchanged,
    void Function(String) onsubmitted,
    void Function() ontap,
    FocusNode focusnode,
    //
    this.readonly = false,
    this.obscure = false,
    this.showcursor = true,
    this.fontsize = 16,
    this.padding = EdgeInsets.zero,
  }) : super(
          text: text,
          controller: controller,
          onchanged: onchanged,
          onsubmitted: onsubmitted,
          ontap: ontap,
          focusnode: focusnode,
        );

  ///
  final TextInputType inputType;

  ///
  final Color background;

  ///
  final Color labelColor;

  ///
  final bool obscure;

  ///
  final bool showcursor;

  ///
  final bool readonly;

  ///
  final double fontsize;

  ///
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final InputDecoration decoration = InputDecoration(
      contentPadding: padding,
      fillColor: background,
      filled: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(64),
      ),
      hintText: text,
      hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
    );

    return TextField(
      style: TextStyle(
        fontSize: fontsize,
        color: const Color(0xFF616161),
      ),
      keyboardType: inputType,
      obscureText: obscure,
      onTap: ontap ?? () {},
      showCursor: showcursor,
      readOnly: readonly,
      textAlign: TextAlign.center,
      onChanged: onchanged ?? (_) {},
      onSubmitted: onsubmitted ?? (_) {},
      controller: controller,
      decoration: decoration,
    );
  }
}
