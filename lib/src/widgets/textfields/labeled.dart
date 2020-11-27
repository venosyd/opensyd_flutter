///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.textfields.internallabel;

import 'package:flutter/material.dart';

import 'abstract.dart';

///
///
///
class LabeledTextEdit extends AbstractOpenSyTextEdit {
  ///
  const LabeledTextEdit({
    @required String text,
    @required TextEditingController controller,
    // cores
    this.labelcolor = const Color(0xFF757575),
    this.backgroundcolor = const Color(0xFFEEEEEE),
    this.foregroundcolor = Colors.black,
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
  final Color labelcolor;

  ///
  final Color backgroundcolor;

  ///
  final Color foregroundcolor;

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
          color: readonly ? hintcolor ?? labelcolor.withAlpha(100) : labelcolor,
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
          fillColor: backgroundcolor,
          border: InputBorder.none,
          labelText: requiredfield ? '$text *' : text,
          labelStyle: TextStyle(
            fontSize: 13,
            color: requiredfield
                ? Colors.red
                : (readonly
                    ? hintcolor ?? foregroundcolor.withAlpha(100)
                    : hintcolor ?? foregroundcolor),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
        ),
      );
}
