///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.input;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';
import '../textfields/_module_.dart';
import 'sobrepose.dart';

///
///
///
class OpenSyInputDialog extends StatefulWidget {
  ///
  const OpenSyInputDialog({
    @required this.text,
    this.onsubmit,
    this.onchanged,
    this.confirmation = false,
  });

  ///
  final String text;

  ///
  final bool confirmation;

  ///
  final void Function(String) onsubmit;

  ///
  final void Function(String, [TextEditingController]) onchanged;

  @override
  _OpenSyInputDialogState createState() => _OpenSyInputDialogState();
}

///
class _OpenSyInputDialogState extends State<OpenSyInputDialog> {
  ///
  final inputcontroller = TextEditingController();

  ///
  final inputfocus = FocusNode();

  ///
  bool sure = false;

  @override
  Widget build(BuildContext context) {
    final dialog = SobreposeDialog(
      width: 320.0,
      height: 225.0,
      functions: [
        //
        SobreposeDialog.CANCEL,
        //
        if (widget.confirmation && sure)
          //
          <String, dynamic>{
            'title': 'CERTEZA? (OK)',
            'action': _ok,
          }
        else
          <String, dynamic>{
            'title': 'OK',
            'action': widget.confirmation ? _areyousure : _ok,
          },
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF757575),
              fontFamily: 'Open Sans',
              fontSize: 16.0,
            ),
          ) //
              .Centered()
              .Height(96),
          //
          LabeledTextEdit(
            controller: inputcontroller,
            onsubmitted: (_) => _ok(),
            onchanged: (String value) {
              (widget.onchanged ?? (_, __) {})(value, inputcontroller);
            },
            focusnode: inputfocus,
            text: 'Digite aqui ...',
          ).Expanded(),
        ],
      ),
    );

    FocusScope.of(context).requestFocus(inputfocus);
    return dialog;
  }

  ///
  void _areyousure() => setState(() => sure = true);

  ///
  void _ok() {
    Navigator.pop(context);
    (widget.onsubmit ?? (_) {})(inputcontroller.text);
  }
}
