///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.pdf.padding;

import 'package:pdf/widgets.dart' as pw;

///
/// Extensoes comodas para diminuir o callback hell
///
extension PDFPadding on pw.Widget {
  ///
  pw.Widget Padding({
    double all,
    double horizontal,
    double vertical,
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    if (horizontal != null) {
      left = horizontal;
      right = horizontal;
    }

    if (vertical != null) {
      top = vertical;
      bottom = vertical;
    }

    if (all != null) {
      top = all;
      bottom = all;
      left = all;
      right = all;
    }

    return pw.Container(
      padding: pw.EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  ///
  pw.Widget Margin({
    double all,
    double horizontal,
    double vertical,
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    if (horizontal != null) {
      left = horizontal;
      right = horizontal;
    }

    if (vertical != null) {
      top = vertical;
      bottom = vertical;
    }

    if (all != null) {
      top = all;
      bottom = all;
      left = all;
      right = all;
    }

    return pw.Container(
      margin: pw.EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}
