///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.textfields.deprecated;

import 'package:flutter/material.dart';

import '_module_.dart';

///
///
///
@Deprecated('Use OpenSyTextEdit')
class UxTextEdit extends OpenSyTextEdit {
  ///
  const UxTextEdit({
    @required TextEditingController controller,
    String text = '',
    // cores
    Color backgroundcolor = const Color(0xFFEEEEEE),
    Color foregroundcolor = Colors.black,
    Color hintcolor,
    // entrada de dados
    int maxlines = 1,
    int maxlength,
    TextInputType inputtype = TextInputType.text,
    bool readonly = false,
    bool obscure = false,
    bool requiredfield = false,
    double fontsize = 18,
    // acoes
    void Function(String) onchanged,
    void Function(String) onsubmitted,
    void Function() ontap,
    FocusNode focusnode,
  }) : super(
          text: text,
          controller: controller,
          background: backgroundcolor,
          foreground: foregroundcolor,
          hintcolor: hintcolor,
          maxlines: maxlines,
          inputtype: inputtype,
          readonly: readonly,
          obscure: obscure,
          requiredfield: requiredfield,
          maxlength: maxlength,
          fontsize: fontsize,
          onchanged: onchanged,
          onsubmitted: onsubmitted,
          ontap: ontap,
          focusnode: focusnode,
        );
}

///
///
///
@Deprecated('Use OpenSyTextArea')
class UxTextArea extends OpenSyTextArea {
  ///
  const UxTextArea({
    @required TextEditingController controller,
    String hintText = '',
    Color hintColor = Colors.grey,
    Color textColor = Colors.black,
    Color filledColor = const Color(0xFFE0E0E0),
    String fontFamily = 'Roboto',
    bool filled = true,
    double fontSize = 18,
    bool readonly = false,
    bool obscure = false,
    void Function(String) onchanged,
    void Function() gesture,
  }) : super(
          controller: controller,
          hintText: hintText,
          hintColor: hintColor,
          textColor: textColor,
          filledColor: filledColor,
          fontFamily: fontFamily,
          filled: filled,
          fontSize: fontSize,
          readonly: readonly,
          obscure: obscure,
          onchanged: onchanged,
          gesture: gesture,
        );
}
