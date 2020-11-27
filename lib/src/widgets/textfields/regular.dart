///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.textfields.regular;

import 'package:flutter/material.dart';

import 'abstract.dart';

///
///
///
class OpenSyTextEdit extends AbstractOpenSyTextEdit {
  ///
  const OpenSyTextEdit({
    @required TextEditingController controller,
    String text = '',
    // cores
    this.background = const Color(0xFFEEEEEE),
    this.foreground = Colors.black,
    this.hintcolor,
    // entrada de dados
    this.maxlines = 1,
    this.inputtype = TextInputType.text,
    this.readonly = false,
    this.obscure = false,
    this.requiredfield = false,
    this.maxlength,
    this.fontsize = 18,
    // acoes
    void Function(String) onchanged,
    void Function(String) onsubmitted,
    void Function() ontap,
    FocusNode focusnode,
  }) : super(
          text: text,
          controller: controller,
          onchanged: onchanged,
          onsubmitted: onsubmitted,
          ontap: ontap,
          focusnode: focusnode,
        );

  ///
  final TextInputType inputtype;

  ///
  final Color background;

  ///
  final Color foreground;

  ///
  final Color hintcolor;

  ///
  final bool readonly;

  ///
  final bool obscure;

  ///
  final bool requiredfield;

  ///
  final int maxlines;

  ///
  final int maxlength;

  ///
  final double fontsize;

  @override
  Widget build(BuildContext context) => TextField(
        style: TextStyle(
          fontSize: fontsize,
          color: foreground,
        ),
        controller: controller,

        // entrada
        obscureText: obscure,
        maxLines: maxlines,
        maxLength: maxlength,
        keyboardType: inputtype,
        readOnly: readonly,

        // acoes
        focusNode: focusnode,
        onTap: ontap ?? () {},
        onChanged: onchanged ?? (_) {},
        onSubmitted: onsubmitted ?? (_) {},

        // decoracao
        decoration: InputDecoration(
          filled: true,
          fillColor: background,
          hintText: text,
          hintStyle: TextStyle(
            color: hintcolor ?? foreground.withAlpha(50),
          ),
          border: requiredfield
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                )
              : InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
        ),
      );
}
