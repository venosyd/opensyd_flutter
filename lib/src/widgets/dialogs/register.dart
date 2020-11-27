///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.register;

import 'package:flutter/material.dart';
import 'package:opensyd_dart/opensyd_dart.dart';

import '../textfields/rounded.dart';
import '_module_.dart';
import '_util_.dart';

///
///
///
class OpenSyRegisterDialog extends StatefulWidget {
  ///
  const OpenSyRegisterDialog({
    this.function,
    this.freecredential = false,
    this.email,
  });

  ///
  final Future<void> Function(String, String) function;

  ///
  final bool freecredential;

  ///
  final String email;

  @override
  _OpenSyRegisterDialogState createState() => _OpenSyRegisterDialogState();
}

///
class _OpenSyRegisterDialogState extends State<OpenSyRegisterDialog>
    with DialogUtils {
  ///
  final _loginctrl = TextEditingController();

  ///
  final _passwdctrl = TextEditingController();

  ///
  final _confirmpasswd = TextEditingController();

  ///
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.email != null) {
      _loginctrl.text = widget.email;
    }

    return SobreposeDialog(
      padding: const EdgeInsets.all(24),
      height: 275,
      width: 300,
      functions: [
        //
        SobreposeDialog.CANCEL,
        //
        <String, dynamic>{
          'title': loading ? 'REGISTRANDO' : 'REGISTRAR',
          'color': loading ? Colors.grey : Colors.blue,
          'action': loading ? () {} : _validate,
        },
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // email
          RoundedTextField(
            text: widget.freecredential ? 'Nome' : 'Email',
            inputType: widget.freecredential
                ? TextInputType.text
                : TextInputType.emailAddress,
            controller: _loginctrl,
          ),

          // senha
          RoundedTextField(
            text: 'Senha',
            obscure: true,
            controller: _passwdctrl,
          ),

          // senha
          RoundedTextField(
            text: 'Confirmar senha',
            obscure: true,
            controller: _confirmpasswd,
          ),
        ],
      ),
    );
  }

  ///
  Future<void> _validate() async {
    setState(() => loading = !loading);

    final login = _loginctrl.text.toLowerCase();
    final passwd = _passwdctrl.text;
    final confirm = _confirmpasswd.text;

    final validcredential =
        widget.freecredential ? login.isname : login.isemail;

    if (!validcredential) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Coloque um email válido',
      );
      setState(() => loading = !loading);
    }
    //
    else if (passwd.isEmpty || passwd.length < 8) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Senha precisa de 8 caracteres pelo menos',
      );
      setState(() => loading = !loading);
    }
    //
    else if (passwd != confirm) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Senha e confirmação devem ser iguais!',
      );
      setState(() => loading = !loading);
    }
    //
    else {
      Navigator.pop(context);

      (widget.function != null)
          ? await widget.function(login, passwd)
          : await Future.delayed(const Duration(seconds: 2), () {});
    }
  }
}
