///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.changepasswd;

import 'package:flutter/material.dart';
import 'package:opensyd_flutter/opensyd_flutter.dart';

import '../../extensions/_module_.dart';
import '../textfields/_module_.dart';
import '_module_.dart';
import '_util_.dart';

///
class OpenSyPasswdChangeDialog extends StatefulWidget {
  ///
  const OpenSyPasswdChangeDialog({this.function});

  ///
  final Future<void> Function(String, String) function;

  @override
  _OpenSyPasswdChangeDialogState createState() =>
      _OpenSyPasswdChangeDialogState();
}

///
class _OpenSyPasswdChangeDialogState extends State<OpenSyPasswdChangeDialog>
    with DialogUtils {
  ///
  final _oldctrl = TextEditingController();

  ///
  final _passwdctrl = TextEditingController();

  ///
  final _confirmctrl = TextEditingController();

  ///
  bool saving = false;

  @override
  Widget build(BuildContext context) => OpenSyBasicDialog(
        radius: 36,
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // senha antiga
                LabeledTextEdit(
                  text: 'Senha antiga',
                  obscure: true,
                  controller: _oldctrl,
                ).CircularRounded(),

                // senha
                LabeledTextEdit(
                  text: 'Senha nova',
                  obscure: true,
                  controller: _passwdctrl,
                ).CircularRounded(),

                // confirmar senha
                LabeledTextEdit(
                  text: 'Confirmar senha',
                  obscure: true,
                  controller: _confirmctrl,
                ).CircularRounded(),
              ],
            ).Expanded(),

            //
            const SizedBox(height: 16),

            /// botao voltar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // voltar
                OpenSyButton(
                  action: () => Navigator.pop(context),
                  text: 'VOLTAR',
                ).Width(128),
                // ok
                OpenSyButton(
                  background: saving ? Colors.grey : Colors.blue,
                  foreground: Colors.white,
                  action: saving ? () {} : _validate,
                  text: 'TROCAR',
                ).Width(128),
              ],
            ).Height(48),
          ],
        ),
      );

  ///
  Future<void> _validate() async {
    setState(() => saving = !saving);

    final oldpasswd = _oldctrl.text;
    final newpasswd = _passwdctrl.text;
    final confirm = _confirmctrl.text;

    if (newpasswd.isEmpty || newpasswd.length < 8) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Senha precisa de 8 caracteres pelo menos',
      );
      setState(() => saving = !saving);

      return;
    }

    if (newpasswd != confirm) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Senha e confirmação devem ser iguais!',
      );
      setState(() => saving = !saving);

      return;
    }

    Navigator.pop(context);

    (widget.function != null)
        ? await widget.function(oldpasswd, newpasswd)
        : await Future.delayed(const Duration(seconds: 2), () {});
  }
}
