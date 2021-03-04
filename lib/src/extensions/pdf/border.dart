///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library opensyd.extensions.pdf.border;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

///
/// Extensoes comodas para diminuir o callback hell
///
extension PDFBorders on pw.Widget {
  ///
  pw.Widget BorderAll({
    double width = 1,
    PdfColor color = PdfColors.black,
  }) =>
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: color, width: width),
        ),
        child: this,
      );

  ///
  pw.Widget BorderBottom({
    double width = 1,
    PdfColor color = PdfColors.black,
  }) =>
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(
              color: color,
              width: width,
            ),
          ),
        ),
        child: this,
      );

  ///
  pw.Widget Border({
    pw.BorderSide top = pw.BorderSide.none,
    pw.BorderSide bottom = pw.BorderSide.none,
    pw.BorderSide left = pw.BorderSide.none,
    pw.BorderSide right = pw.BorderSide.none,
  }) =>
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ),
        ),
        child: this,
      );
}
