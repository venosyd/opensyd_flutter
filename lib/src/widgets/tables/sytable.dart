///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.table.sytable;

import 'package:flutter/material.dart';
import '../../extensions/_module_.dart';

///
///
///
class OpenSyTable extends StatefulWidget {
  ///
  const OpenSyTable({
    @required this.headers,
    this.rows = const [],
    this.flex = const [],
    this.contentpadding = 0,
    this.contentbackground = Colors.transparent,
    this.headerbackground = Colors.transparent,
    this.bordercolor = const Color(0xFFE0E0E0),
    this.overcolor = const Color(0xFFFCFCFC),
    this.rowaction,
  });

  ///
  final List<Widget> headers;

  ///
  final List<List<Widget>> rows;

  ///
  final List<int> flex;

  ///
  final double contentpadding;

  ///
  final Color headerbackground;

  ///
  final Color bordercolor;

  ///
  final Color contentbackground;

  ///
  final Color overcolor;

  ///
  final void Function(int row) rowaction;

  @override
  _OpenSyTableState createState() => _OpenSyTableState();
}

///
class _OpenSyTableState extends State<OpenSyTable> {
  ///
  int overrow;

  ///
  int flex(int index) => widget.flex.isNotEmpty && widget.flex.length > index
      ? widget.flex[index]
      : 1;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //
          // header
          //
          Row(
            children: [
              for (var i = 0; i < widget.headers.length; i++)
                widget.headers[i]
                    .Padding(horizontal: widget.contentpadding)
                    .Expanded(flex(i))
            ],
          ) //
              .Height(42)
              .Padding(vertical: 8, horizontal: 12)
              .Colored(widget.headerbackground)
              .BorderBottom(color: widget.bordercolor),
          //
          // content
          //
          MouseRegion(
            onExit: (_) => setState(() => overrow = null),
            child: Scrollbar(
              child: ListView.builder(
                itemCount: widget.rows.length,
                itemBuilder: (_, i) => MouseRegion(
                  onEnter: (_) => setState(() => overrow = i),
                  //
                  child: Row(
                    children: [
                      for (var j = 0; j < widget.headers.length; j++)
                        widget.rows[i][j]
                            .Padding(
                              horizontal: widget.contentpadding,
                              vertical: 1,
                            )
                            .Expanded(flex(j))
                    ],
                  ) //
                      .Padding(vertical: 4, horizontal: 12)
                      .Ripplefy(
                          action: () => (widget.rowaction ?? (_) {})(i),
                          color: overrow == i //
                              ? widget.overcolor
                              : Colors.transparent)
                      .BorderBottom(color: widget.bordercolor),
                  //
                ),
              ),
            ),
          ) //
              .Colored(widget.contentbackground)
              .Expanded(),
        ],
      ).CircularRounded();
}
