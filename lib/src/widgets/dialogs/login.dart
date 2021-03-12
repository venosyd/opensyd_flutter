///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.login;

import 'package:flutter/material.dart';
import 'package:opensyd_dart/opensyd_dart.dart';

import '../textfields/rounded.dart';
import '_module_.dart';
import 'sobrepose.dart';

///
///
///
class OpenSyLoginDialog extends StatefulWidget {
  ///
  const OpenSyLoginDialog({
    this.function,
    this.email,
    this.freecredential = false,
  });

  ///
  final Future<void> Function(String, String) function;

  ///
  final bool freecredential;

  ///
  final String email;

  @override
  _OpenSyLoginDialogState createState() => _OpenSyLoginDialogState();
}

///
class _OpenSyLoginDialogState extends State<OpenSyLoginDialog> {
  ///
  final _logincontroller = TextEditingController();

  ///
  final _passwdcontroller = TextEditingController();

  ///
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.email != null) {
      _logincontroller.text = widget.email;
    }

    return SobreposeDialog(
      padding: const EdgeInsets.all(24),
      height: 225,
      width: 300,
      functions: [
        //
        SobreposeDialog.CANCEL,
        //
        <String, dynamic>{
          'title': loading ? 'ENTRANDO' : 'ENTRAR',
          'color': loading ? Colors.grey : Colors.blue,
          'action': loading ? () {} : _validate,
        },
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //
          RoundedTextField(
            text: widget.freecredential ? 'Nome' : 'Email',
            inputType: widget.freecredential
                ? TextInputType.text
                : TextInputType.emailAddress,
            controller: _logincontroller,
          ),
          //
          RoundedTextField(
            text: 'Senha',
            obscure: true,
            controller: _passwdcontroller,
          ),
        ],
      ),
    );
  }

  ///
  Future<void> _validate() async {
    setState(() => loading = !loading);

    final login = _logincontroller.text.toLowerCase();
    final passwd = _passwdcontroller.text;
    final validcredential = widget.freecredential //
        ? login.isname
        : login.isemail;

    if (!validcredential) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Coloque um email válido',
      );
      setState(() => loading = !loading);

      return;
    }

    Navigator.pop(context);
    await (widget.function ?? (_, __) async {})(login, passwd);
  }
}
