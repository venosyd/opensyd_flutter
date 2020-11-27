///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.bars;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';

///
///
///
@Deprecated('Sem substituto no momento')
class SidebarWidget extends StatefulWidget {
  ///
  const SidebarWidget({
    this.icons = const {},
    this.logo,
    this.backgroundColor,
    this.iconsColor,
    this.color = Colors.blue,
    this.selected = '',
  });

  ///
  final Map<String, Function> icons;

  ///
  final Color color;

  ///
  final Color backgroundColor;

  ///
  final Color iconsColor;

  ///
  final String selected;

  ///
  final Widget logo;

  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

///
class _SidebarWidgetState extends State<SidebarWidget> {
  String selected = '';

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // logo
          widget.logo.Padding(all: 12).Height(128),

          // espaco entre o logo e os icones
          const Spacer(),

          // icons
          for (String icon in widget.icons.keys)
            FlatButton(
              onPressed: () {
                widget.icons[icon]();
                setState(() => selected = icon);
              },
              child: Image.asset(
                'assets/png/$icon.png',
                color: selected == icon
                    ? widget.color
                    : (widget.iconsColor ?? Colors.grey),
              ) //
                  .Padding(all: 14)
                  .Height(96),
            ),
        ],
      ).Colored(widget.backgroundColor ?? const Color(0xFFE0E0E0));
}
