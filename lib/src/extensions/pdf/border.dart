///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.pdf.border;

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
          border: pw.Border.all(
            color: color,
            width: width,
          ),
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
          border: pw.Border.all(
            color: color,
            width: width,
          ),
        ),
        child: this,
      );

  ///
  pw.Widget Border({
    bool top = false,
    bool bottom = false,
    bool left = false,
    bool right = false,
    double width = 1,
    PdfColor color = PdfColors.black,
  }) =>
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(
            color: color,
            width: width,
          ),
        ),
        child: this,
      );
}
