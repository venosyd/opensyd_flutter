///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.passwdrecover;

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:opensyd_dart/opensyd_dart.dart';

import '../../extensions/_module_.dart';
import '../textfields/_module_.dart';
import '_module_.dart';

///
///
///
class SyPasswdRecoverDialog extends StatefulWidget {
  ///
  const SyPasswdRecoverDialog({
    @required this.changepasswd,
    @required this.requirechange,
    @required this.emailmessage,
    this.service = 'Opensyd',
  });

  ///
  final Future<String> Function(String, String) changepasswd;

  ///
  final Future<Map<String, dynamic>> Function(String, String, String)
      requirechange;

  ///
  final String emailmessage;

  ///
  final String service;

  @override
  _SyPasswdRecoverDialogState createState() => _SyPasswdRecoverDialogState();
}

///
class _SyPasswdRecoverDialogState extends State<SyPasswdRecoverDialog> {
  ///
  final _emailcontrol = TextEditingController();

  ///
  final _hashcontrol = TextEditingController();

  ///
  final _passwdcontrol = TextEditingController();

  ///
  final _confirmpasswdcontrol = TextEditingController();

  ///
  bool sending = false;

  ///
  bool loading = false;

  @override
  Widget build(BuildContext context) => SobreposeDialog(
        padding: const EdgeInsets.all(24),
        width: 320,
        height: 540,
        functions: [
          //
          SobreposeDialog.CANCEL,
          //
          <String, dynamic>{
            'title': loading ? 'MUDANDO' : 'MUDAR',
            'color': loading ? Colors.grey : Colors.blue,
            'action': loading ? () {} : _sendnewpasswd,
          },
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //
            const Text(
              'Digite o email para enviarmos o código',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Open Sans Light',
                color: Color(0xFF424242),
                fontSize: 14,
              ),
            ),
            //
            LabeledTextEdit(
              text: 'Email',
              fontsize: 18,
              controller: _emailcontrol,
            ),
            //
            FlatButton(
              color: sending ? const Color(0xFFBDBDBD) : Colors.green,
              shape: const StadiumBorder(),
              onPressed: sending ? () {} : _sendmail,
              child: Text(
                sending ? 'ENVIANDO...' : 'ENVIAR EMAIL',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ).Width(200),
            //
            const Text(
              'Quando tiver o código, digite-o no campo '
              'abaixo com a nova senha',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Open Sans Light',
                color: Color(0xFF424242),
                fontSize: 14,
              ),
            ),
            //
            LabeledTextEdit(
              text: 'Código',
              fontsize: 18,
              controller: _hashcontrol,
            ),
            //
            LabeledTextEdit(
              text: 'Nova Senha',
              fontsize: 18,
              obscure: true,
              controller: _passwdcontrol,
            ),
            //
            LabeledTextEdit(
              text: 'Confirmar Senha',
              fontsize: 18,
              obscure: true,
              controller: _confirmpasswdcontrol,
            ),
          ],
        ),
      );

  ///
  ///
  ///
  Future<void> _sendmail() async {
    setState(() => sending = !sending);

    final email = _emailcontrol.text;

    if (!ValidateText.validateEmail(email)) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Insira um email válido',
      );
      return;
    }

    await widget.requirechange(
      email,
      widget.emailmessage,
      widget.service,
    );

    OpenSyDialogs.alert(
      context: context,
      message: 'Enviado!\nVerifique seu email e pegue o código',
    );

    setState(() => sending = !sending);
  }

  ///
  ///
  ///
  Future<void> _sendnewpasswd() async {
    setState(() => loading = !loading);

    final hash = _hashcontrol.text;
    final passwd = _passwdcontrol.text;
    final confirm = _confirmpasswdcontrol.text;

    if (hash.length != 5) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Insira o código que autoriza você a mudar de senha',
      );
      setState(() => loading = !loading);
    }
    //
    else if (!ValidateSecurity.validatePasswd(passwd)) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Senha de pelo menos 8 dígitos!',
      );
      setState(() => loading = !loading);
    }
    //
    else if (passwd != confirm) {
      OpenSyDialogs.alert(
        context: context,
        message: 'Senha e confirmação precisam ser iguais',
      );
      setState(() => loading = !loading);
    }
    //
    else {
      final result = await widget.changepasswd(
        sha256.convert(passwd.codeUnits).toString(),
        hash.toLowerCase(),
      );

      OpenSyDialogs.alert(
        context: context,
        yesOnPressed: () => Navigator.pop(context),
        message: result == 'SUCCESS'
            ? 'Senha trocada! Pode fazer o login'
            : 'Seu código expirou. Peça um novo',
      );
    }
  }
}
