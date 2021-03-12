///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.dialogs.basicdialog;

import 'package:flutter/material.dart';
import 'package:opensyd_dart/opensyd_dart.dart';

///
class FlutterMasks {
  ///
  static void urloremail(String value, TextEditingController controller) {
    controller.text = Masks.urlemailmask(value);

    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  ///
  static void integer(String value, TextEditingController controller) {
    final integer = value.onlydigits;

    controller.value = controller.value.copyWith(
      text: integer,
      selection: TextSelection.fromPosition(
        TextPosition(offset: integer.length),
      ),
    );
  }

  ///
  static void number(String value, TextEditingController controller) {
    controller.text = Masks.editnumbermask(value);

    controller.selection = TextSelection(
      baseOffset: controller.text.length,
      extentOffset: controller.text.length,
    );
  }

  ///
  static void money(String value, TextEditingController controller) {
    controller.text = Masks.editnumbermask(value);

    controller.selection = TextSelection(
      baseOffset: controller.text.length,
      extentOffset: controller.text.length,
    );
  }

  ///
  static void percentage(String value, TextEditingController controller) {
    final percentage = Masks.percentmask(value);

    controller.value = controller.value.copyWith(
      text: percentage,
      selection: TextSelection.fromPosition(
        TextPosition(offset: percentage.length),
      ),
    );
  }

  ///
  static void intpercentage(String value, TextEditingController controller) {
    final percentage = Masks.intpercentmask(value);

    controller.value = controller.value.copyWith(
      text: percentage,
      selection: TextSelection.fromPosition(
        TextPosition(offset: percentage.length),
      ),
    );
  }

  ///
  static void date(String value, TextEditingController controller) {
    final a = value.onlydigits;

    if (a.length <= 8) {
      if (a.length == 3) {
        controller.text = '${a.substring(0, 2)}/'
            '${a.substring(2)}';
      }
      //
      else if (a.length == 5) {
        controller.text = '${a.substring(0, 2)}/'
            '${a.substring(2, 4)}/'
            '${a.substring(4)}';
      }
    }
    //
    else {
      controller.text = '${a.substring(0, 2)}/'
          '${a.substring(2, 4)}/'
          '${a.substring(4, 8)}';
    }

    controller.selection = TextSelection(
      baseOffset: controller.text.length,
      extentOffset: controller.text.length,
    );
  }

  ///
  static void cep(String value, TextEditingController controller) {
    final cep = Masks.cepmask(value);

    controller.value = controller.value.copyWith(
      text: cep,
      selection: TextSelection.fromPosition(
        TextPosition(offset: cep.length),
      ),
    );
  }

  ///
  static void phone(String value, TextEditingController controller) {
    final phone = Masks.phonemask(value);

    controller.value = controller.value.copyWith(
      text: phone,
      selection: TextSelection.fromPosition(
        TextPosition(offset: phone.length),
      ),
    );
  }

  ///
  static void cnp(String value, TextEditingController controller) {
    final cnp = value.onlydigits.length > 11
        ? value = Masks.cnpjmask(value)
        : value = Masks.cpfmask(value);

    controller.value = controller.value.copyWith(
      text: cnp,
      selection: TextSelection.fromPosition(
        TextPosition(offset: cnp.length),
      ),
    );
  }

  ///
  static void cnpj(String value, TextEditingController controller) {
    if (value.length > 18) {
      controller.text = value.substring(0, 18);
    }
    //
    else {
      final cnpj = Masks.cnpjmask(value.onlydigits);

      controller.value = controller.value.copyWith(
        text: cnpj,
        selection: TextSelection.fromPosition(
          TextPosition(offset: cnpj.length),
        ),
      );
    }
  }

  ///
  static void cpf(String value, TextEditingController controller) {
    if (value.length > 14) {
      controller.text = value.substring(0, 14);
    }
    //
    else {
      final cpf = Masks.cpfmask(value.onlydigits);

      controller.value = controller.value.copyWith(
        text: cpf,
        selection: TextSelection.fromPosition(
          TextPosition(offset: cpf.length),
        ),
      );
    }
  }
}
