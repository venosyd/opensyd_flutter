///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library com.venosyd.opensource.aio.widgets.services.pagseguro.checkout;

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:opensyd_dart/opensyd_dart.dart';

import '../../extensions/_module_.dart';
import '../dialogs/_module_.dart';
import '../textfields/_module_.dart';

///
///
///
class PagSeguroCheckoutDialog extends StatefulWidget {
  ///
  const PagSeguroCheckoutDialog({
    @required this.createSession,
    @required this.doCheckout,
    @required this.amount,
    @required this.host,
    @required this.parcelas,
    @required this.itemDescricao,
    @required this.itemSigla,
    this.refresh,
    this.process,
  });

  ///
  final void Function() refresh;

  ///
  final Future<void> Function() process;

  ///
  final Future<String> Function() createSession;

  ///
  final Function doCheckout;

  ///
  final String amount;

  ///
  final String host;

  ///
  final String parcelas;

  ///
  final String itemDescricao;

  ///
  final String itemSigla;

  @override
  _PagSeguroCheckoutDialogState createState() =>
      _PagSeguroCheckoutDialogState();
}

///
class _PagSeguroCheckoutDialogState extends State<PagSeguroCheckoutDialog> {
  ///
  final _nomectrl = TextEditingController();

  ///
  final _cpfctrl = TextEditingController();

  ///
  final _dddctrl = TextEditingController();

  ///
  final _phonectrl = TextEditingController();

  ///
  final _emailctrl = TextEditingController();

  ///
  final _ccnumeroctrl = TextEditingController();

  ///
  final _cccvvctrl = TextEditingController();

  ///
  final _ccmesexpctrl = TextEditingController();

  ///
  final _ccanoexpctrl = TextEditingController();

  ///
  final _ccbirthdayctrl = TextEditingController();

  ///
  List<Widget> fields;

  ///
  bool loading = false;

  @override
  void initState() {
    super.initState();

    // inicia as telas
    fields = [
      //
      SizedBox(
        height: 320,
        child: _PersonalDataFields(
          nomectrl: _nomectrl,
          cpfctrl: _cpfctrl,
          dddctrl: _dddctrl,
          phonectrl: _phonectrl,
          emailctrl: _emailctrl,
        ),
      ),
      //
      SizedBox(
        height: 385,
        child: _CCDataFields(
          ccnumeroctrl: _ccnumeroctrl,
          cccvvctrl: _cccvvctrl,
          ccmesexpctrl: _ccmesexpctrl,
          ccanoexpctrl: _ccanoexpctrl,
          ccbirthdayctrl: _ccbirthdayctrl,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => SobreposeDialog(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 580,
        functions: [
          <String, dynamic>{
            'title': loading ? 'CANCELAR' : 'VOLTAR',
            'color': loading ? Colors.red : Colors.grey,
            'action': loading
                ? () {
                    setState(() => loading = false);
                  }
                : () {
                    Navigator.pop(context);
                  },
          },
          <String, dynamic>{
            'title': loading ? 'PROCESSANDO...' : 'SUBMETER',
            'color': loading ? Colors.grey : Colors.green,
            'action': loading ? () {} : _checkData,
          },
        ],
        child: Column(
          children: <Widget>[
            //
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Checkout ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'PagSeguro',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF008b86),
                    ),
                  ),
                ],
              ),
            ).Centered().Height(64),
            //
            ListView(children: fields).Expanded(),
          ],
        ),
      );

  ///
  /// valida os campos
  ///
  void _checkData() {
    // dados pessoais
    if (_nomectrl.text.isnotname) {
      _nomectrl.text = '';
      _message('Nome inválido');
    }
    //
    else if (_cpfctrl.text.isnotcpf) {
      _cpfctrl.text = '';
      _message('CPF inválido');
    }
    //
    else if (_dddctrl.text.isnotonlydigits) {
      _dddctrl.text = '';
      _message('DDD inválido');
    }
    //
    else if (_phonectrl.text.isnotphone) {
      _phonectrl.text = '';
      _message('Telefone inválido');
    }
    //
    else if (_emailctrl.text.isnotemail) {
      _emailctrl.text = '';
      _message('Email inválido');
    }
    // cartao
    else if (_cccvvctrl.text.isnotonlydigits) {
      _cccvvctrl.text = '';
      _message('Código de validação do cartão inválido');
    }
    //
    else if (_ccmesexpctrl.text.isnotonlydigits &&
        _ccmesexpctrl.text.length != 2) {
      _ccmesexpctrl.text = '';
      _message('Mês de expiração do cartão inválido');
    }
    //
    else if (_ccanoexpctrl.text.isnotonlydigits &&
        _ccanoexpctrl.text.length != 4) {
      _ccanoexpctrl.text = '';
      _message('Ano de expiração do cartão inválido');
    }
    // executa operacao de submissao
    else {
      setState(() => loading = true);
      _startprocess();
    }
  }

  ///
  void _message(String msg) =>
      OpenSyDialogs.alert(context: context, message: msg);

  ///
  Future<void> _startprocess() async {
    final sessionID = await widget.createSession();
    final webview = FlutterWebviewPlugin();

    webview.launch('${widget.host}pagseguro.html?sessionID=$sessionID',
        hidden: true,
        javascriptChannels: <JavascriptChannel>{
          JavascriptChannel(
              name: 'Print',
              onMessageReceived: (JavascriptMessage message) {
                _processpayment(sessionID, message.message);
                webview.dispose();
                webview.close();
              })
        });
  }

  ///
  Future<void> _processpayment(String sessionID, String senderhash) async {
    final result = await widget.doCheckout(
      sessionID,
      widget.itemDescricao,
      widget.itemSigla,
      _nomectrl.text,
      _cpfctrl.text.onlydigits,
      _dddctrl.text,
      _phonectrl.text,
      _emailctrl.text,
      senderhash,
      widget.amount,
      _ccnumeroctrl.text,
      _cccvvctrl.text,
      _ccmesexpctrl.text,
      _ccanoexpctrl.text,
      _ccbirthdayctrl.text,
      widget.parcelas,
    ) as Map<String, dynamic>;

    if (result['status'] == 'ok') {
      await (widget.process ?? () async {})();

      OpenSyDialogs.alert(
        context: context,
        message: 'Compra aprovada!',
        yesOnPressed: () {
          Navigator.pop(context);
          (widget.refresh ?? () {})();
        },
      );
    } else {
      _message(
        'Verifique os dados que você digitou, tivemos '
        'problemas processando sua compra. Tente novamente mais tarde',
      );
    }

    setState(() => loading = false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

///
///
///
class _PersonalDataFields extends StatefulWidget {
  ///
  const _PersonalDataFields({
    this.nomectrl,
    this.cpfctrl,
    this.dddctrl,
    this.phonectrl,
    this.emailctrl,
  });

  ///
  final TextEditingController nomectrl;

  ///
  final TextEditingController cpfctrl;

  ///
  final TextEditingController dddctrl;

  ///
  final TextEditingController phonectrl;

  ///
  final TextEditingController emailctrl;

  @override
  __PersonalDataFieldsState createState() => __PersonalDataFieldsState();
}

///
class __PersonalDataFieldsState extends State<_PersonalDataFields> {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          //
          const Text(
            'Dados pessoais',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF424242),
            ),
          ) //
              .Centered()
              .Height(48),
          //
          Column(
            children: <Widget>[
              //
              LabeledTextEdit(
                controller: widget.nomectrl,
                fontsize: 14,
                text: 'Nome',
              ),
              const SizedBox(height: 8),
              //
              LabeledTextEdit(
                controller: widget.emailctrl,
                fontsize: 14,
                text: 'Email',
                inputtype: TextInputType.emailAddress,
              ),
              //
              const SizedBox(height: 8),
              //
              LabeledTextEdit(
                controller: widget.cpfctrl,
                fontsize: 14,
                text: 'CPF',
                inputtype: TextInputType.number,
              ),
              //
              const SizedBox(height: 8),
              //
              Row(
                children: <Widget>[
                  //
                  SizedBox(
                    width: 70,
                    child: LabeledTextEdit(
                      controller: widget.dddctrl,
                      fontsize: 14,
                      text: 'DDD',
                      inputtype: TextInputType.phone,
                    ),
                  ),
                  //
                  const SizedBox(width: 8),
                  //
                  LabeledTextEdit(
                    controller: widget.phonectrl,
                    fontsize: 14,
                    text: 'Telefone',
                    inputtype: TextInputType.phone,
                  ).Expanded(),
                ],
              ),
            ],
          ).Expanded(),
        ],
      );
}

///
///
///
class _CCDataFields extends StatefulWidget {
  ///
  const _CCDataFields({
    this.ccnumeroctrl,
    this.cccvvctrl,
    this.ccmesexpctrl,
    this.ccanoexpctrl,
    this.ccbirthdayctrl,
  });

  ///
  final TextEditingController ccnumeroctrl;

  ///
  final TextEditingController cccvvctrl;

  ///
  final TextEditingController ccmesexpctrl;

  ///
  final TextEditingController ccanoexpctrl;

  ///
  final TextEditingController ccbirthdayctrl;

  @override
  __CCDataFieldsState createState() => __CCDataFieldsState();
}

///
class __CCDataFieldsState extends State<_CCDataFields> {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          //
          const Text(
            'Cartão de crédito',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF424242),
            ),
          ) //
              .Centered()
              .Height(48),
          //
          Column(
            children: <Widget>[
              //
              LabeledTextEdit(
                controller: widget.ccnumeroctrl,
                fontsize: 14,
                text: 'Número do Cartão de crédito',
                inputtype: TextInputType.number,
              ),
              //
              const SizedBox(height: 8),
              //
              LabeledTextEdit(
                controller: widget.cccvvctrl,
                fontsize: 14,
                text: 'Código de verificação',
                inputtype: TextInputType.number,
              ),
              //
              const SizedBox(height: 8),
              //
              LabeledTextEdit(
                controller: widget.ccmesexpctrl,
                fontsize: 14,
                text: 'Mês de expiração',
                inputtype: TextInputType.number,
              ),
              //
              const SizedBox(height: 8),
              //
              LabeledTextEdit(
                controller: widget.ccanoexpctrl,
                fontsize: 14,
                text: 'Ano de expiração',
                inputtype: TextInputType.number,
              ),
              //
              const SizedBox(height: 8),
              //
              LabeledTextEdit(
                controller: widget.ccbirthdayctrl,
                fontsize: 14,
                text: 'Nascimento (DD/MM/AAAA)',
              ),
            ],
          ).Expanded(),
        ],
      );
}
