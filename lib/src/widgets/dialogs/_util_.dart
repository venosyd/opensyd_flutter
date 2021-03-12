///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.util;

import 'package:flutter/material.dart';

/// utilidades para dialogos
mixin DialogUtils {
  ///
  void printerror(TextEditingController ctrl, String message) {
    ctrl.text = message;
    ctrl.selection = TextSelection(
      baseOffset: 0,
      extentOffset: message.length,
    );
  }
}
