///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.abstract;

import 'package:flutter/material.dart';

///
///
///
abstract class AbstractOpenSyTextEdit extends StatelessWidget {
  ///
  const AbstractOpenSyTextEdit({
    this.controller,
    this.text = '',
    this.onchanged,
    this.onsubmitted,
    this.ontap,
    this.focusnode,
  });

  ///
  final String text;

  ///
  final TextEditingController controller;

  ///
  final FocusNode focusnode;

  ///
  final void Function(String) onchanged;

  ///
  final void Function(String) onsubmitted;

  ///
  final void Function() ontap;
}
