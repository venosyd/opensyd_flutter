///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.selectors.dropdaun;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions/_module_.dart';

///
///
///
class OpenSyDropDown<T> extends StatelessWidget {
  ///
  const OpenSyDropDown({
    @required this.original,
    this.options = const [],
    this.optionswithicons = const {},
    this.onchanged,
  });

  ///
  final T original;

  ///
  final List<T> options;

  ///
  final Map<T, IconData> optionswithicons;

  ///
  final void Function(T) onchanged;

  @override
  Widget build(BuildContext context) => DropdownButton<T>(
        isExpanded: true,
        value: original,
        onChanged: onchanged,
        underline: Container(),
        items: options.isNotEmpty
            //
            ? options
                .map((value) => DropdownMenuItem<T>(
                      value: value,
                      child: Text('$value'),
                    ))
                .toList()
            //
            : optionswithicons.keys
                .map((value) => DropdownMenuItem<T>(
                      value: value,
                      child: Row(
                        children: [
                          //
                          FaIcon(
                            optionswithicons[value],
                            color: const Color(0xFF424242),
                            size: 18,
                          ) //
                              .Centered()
                              .Box(24)
                              .Margin(right: 16),
                          //
                          Text('$value'),
                        ],
                      ),
                    ))
                .toList(),
      );
}
