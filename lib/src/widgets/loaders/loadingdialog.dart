///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widget.loaders.loadingdialog;

import 'package:flutter/material.dart';

import '../../extensions/_module_.dart';

///
class LoadingDialog extends StatelessWidget {
  ///
  const LoadingDialog(this.popContext, {this.text});

  ///
  final BuildContext popContext;

  ///
  final String text;

  ///
  bool get iscompound => text != null && text.isNotEmpty;

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //
            if (iscompound)
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            //
            if (iscompound) const SizedBox(height: 24),
            //
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ) //
            .Height(iscompound ? 128 : 64)
            .Centered(),
      );

  ///
  void finish() => Navigator.pop(popContext);
}
