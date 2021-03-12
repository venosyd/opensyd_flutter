///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.dialog;

import 'package:flutter/material.dart';

import 'changepasswd.dart';
import 'choice.dart';
import 'dialog.dart';
import 'input.dart';
import 'login.dart';
import 'register.dart';

export '_deprecated_.dart';
export 'basicdialog.dart';
export 'changepasswd.dart';
export 'choice.dart';
export 'dialog.dart';
export 'input.dart';
export 'login.dart';
export 'register.dart';
export 'sobrepose.dart';

///
/// Utilidaes para criacao de dialogos
///
abstract class OpenSyDialogs {
  ///
  /// exibe a snackbar
  ///
  static void showSnackbar({
    @required BuildContext context,
    String message,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: 300,
          content: Text(message, textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
        ),
      );

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void choice({
    @required BuildContext context, // context
    String message, // mensagem do dialogo
    void Function() yesOnPressed, // funcao ao apertar sim
    void Function() noOnPressed, // funcao ao apertar nao
    void Function(OpenSyChoiceDialog) then, // chamada depois do dispose
    bool confirmation = false, // se precisar de confirmacao a mais
  }) =>
      showDialog<OpenSyChoiceDialog>(
        context: context,
        builder: (_) => OpenSyChoiceDialog(
          text: message,
          yesfunction: yesOnPressed,
          nofunction: noOnPressed,
          confirmation: confirmation,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void input({
    @required BuildContext context, // context
    void Function(String) onsubmit, // funcao de coleta
    void Function(String, [TextEditingController]) onchanged,
    void Function(OpenSyInputDialog) then, // chamada depois do dispose
    String message, // mensagem do dialogo
    bool confirmation = false, // se precisar de confirmacao a mais
  }) =>
      showDialog<OpenSyInputDialog>(
        context: context,
        builder: (_) => OpenSyInputDialog(
          text: message,
          onsubmit: onsubmit,
          onchanged: onchanged,
          confirmation: confirmation,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void alert({
    @required BuildContext context, // context
    String message, // mensagem do dialogo
    void Function() yesOnPressed /* funcao ao apertar sim */,
    void Function(OpenSyDialog) then, // chamada depois do dispose
  }) =>
      showDialog<OpenSyDialog>(
        context: context,
        builder: (_) => OpenSyDialog(
          text: message,
          function: yesOnPressed,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void bigalert({
    @required BuildContext context, // context
    String message, // mensagem do dialogo
    void Function() yesOnPressed /* funcao ao apertar sim */,
    void Function(OpenSyDialog) then, // chamada depois do dispose
  }) =>
      showDialog<OpenSyDialog>(
        context: context,
        builder: (_) => OpenSyDialog(
          width: 384,
          height: 326,
          text: message,
          function: yesOnPressed,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void largealert({
    @required BuildContext context, // context
    String message, // mensagem do dialogo
    void Function() yesOnPressed /* funcao ao apertar sim */,
    void Function(OpenSyDialog) then, // chamada depois do dispose
  }) =>
      showDialog<OpenSyDialog>(
        context: context,
        builder: (_) => OpenSyDialog(
          width: 512,
          height: 416,
          text: message,
          function: yesOnPressed,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void customalert({
    @required BuildContext context, // context
    @required double width,
    @required double height,
    Color background,
    Color foreground,
    String message, // mensagem do dialogo
    void Function() yesOnPressed /* funcao ao apertar sim */,
    void Function(OpenSyDialog) then, // chamada depois do dispose
  }) =>
      showDialog<OpenSyDialog>(
        context: context,
        builder: (_) => OpenSyDialog(
          text: message,
          function: yesOnPressed,
          width: width,
          height: height,
          background: background,
          foreground: foreground,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void changepasswd({
    @required BuildContext context, // context
    Future<void> Function(String, String) yesOnPressed,
    void Function(OpenSyPasswdChangeDialog) then, // chamada depois do dispose
  }) =>
      showDialog<OpenSyPasswdChangeDialog>(
        context: context,
        builder: (_) => OpenSyPasswdChangeDialog(
          function: yesOnPressed,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void register({
    @required BuildContext context, // context
    String email,
    Future<void> Function(String, String) yesOnPressed,
    void Function(OpenSyRegisterDialog) then, // chamada depois do dispose
    bool freecredential = false,
  }) =>
      showDialog<OpenSyRegisterDialog>(
        context: context,
        builder: (_) => OpenSyRegisterDialog(
          function: yesOnPressed,
          freecredential: freecredential,
          email: email,
        ),
      ).then(then ?? (_) {});

  ///
  /// cria um choice dialog de sim e nao
  ///
  static void login({
    @required BuildContext context, // context
    String email,
    Future<void> Function(String, String) yesOnPressed,
    void Function(OpenSyLoginDialog) then, // chamada depois do dispose
    bool freecredential = false,
  }) =>
      showDialog<OpenSyLoginDialog>(
        context: context,
        builder: (_) => OpenSyLoginDialog(
          function: yesOnPressed,
          freecredential: freecredential,
          email: email,
        ),
      ).then(then ?? (_) {});
}
