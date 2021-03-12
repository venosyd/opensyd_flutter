///
/// venosyd © 2016-2021. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.pdf.decoration;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

///
/// Extensoes comodas para diminuir o callback hell
///
extension PDFDecoration on pw.Widget {
  ///
  pw.Widget Colored(PdfColor color) => pw.Container(
        color: color,
        child: this,
      );

  ///
  pw.Widget Rounded([
    double horizontalRadius = 24,
    double verticalRadius = 24,
  ]) =>
      pw.ClipRRect(
        horizontalRadius: horizontalRadius,
        verticalRadius: verticalRadius,
        child: this,
      );

  ///
  pw.Widget CircularRounded([double radius = 8.0]) => pw.ClipRRect(
        horizontalRadius: radius,
        verticalRadius: radius,
        child: this,
      );
}
