///
/// venosyd © 2016-2020 sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.pdf.dashline;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../extensions/_module_.dart';

///
class PDFDashLine extends pw.StatelessWidget {
  ///
  PDFDashLine({
    this.straight = false,
    this.color = PdfColors.black,
  });

  ///
  final bool straight;

  ///
  final PdfColor color;

  @override
  pw.Widget build(pw.Context context) => straight
      //
      ? pw.Text(
          '|\n' * 128,
          style: pw.TextStyle(color: color),
        ).Width(8)
      //
      : pw.Text(
          '-' * 128,
          style: pw.TextStyle(color: color),
        ).Height(16);
}
