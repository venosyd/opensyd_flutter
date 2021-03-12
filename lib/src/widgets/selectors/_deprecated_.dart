///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.selectors.deprecated;

import 'package:flutter/material.dart';

import '_module_.dart';

///
///
///
@Deprecated('Use OpenSyDropDown')
class UxDropdown<T> extends OpenSyDropDown<T> {
  ///
  const UxDropdown({
    @required T original,
    List<T> options = const [],
    Map<T, IconData> optionswithicons = const {},
    void Function(T) onchanged,
  }) : super(
          original: original,
          options: options,
          optionswithicons: optionswithicons,
          onchanged: onchanged,
        );
}
