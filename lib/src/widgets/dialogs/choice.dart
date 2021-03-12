///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.choice;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';
import 'sobrepose.dart';

///
///
///
class OpenSyChoiceDialog extends StatefulWidget {
  ///
  const OpenSyChoiceDialog({
    @required this.text,
    this.yesfunction,
    this.nofunction,
    this.confirmation = false,
  });

  ///
  final String text;

  ///
  final void Function() yesfunction;

  ///
  final void Function() nofunction;

  ///
  final bool confirmation;

  @override
  _OpenSyChoiceDialogState createState() => _OpenSyChoiceDialogState();
}

///
class _OpenSyChoiceDialogState extends State<OpenSyChoiceDialog> {
  ///
  bool sure = false;

  @override
  Widget build(BuildContext context) => SobreposeDialog(
        height: 200,
        functions: [
          //
          <String, dynamic>{
            'title': 'NÃO',
            'action': _no,
          },
          //
          if (widget.confirmation && sure)
            <String, dynamic>{
              'title': 'CERTEZA? (SIM)',
              'action': _yes,
            }
          else
            <String, dynamic>{
              'title': 'SIM',
              'action': widget.confirmation ? _areyousure : _yes,
            },
        ],
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Open Sans',
            fontSize: 18,
          ),
        ).Centered(),
      );

  ///
  void _areyousure() => setState(() => sure = true);

  ///
  void _yes() {
    Navigator.pop(context);
    (widget.yesfunction ?? () {})();
  }

  ///
  void _no() {
    Navigator.pop(context);
    (widget.nofunction ?? () {})();
  }
}
