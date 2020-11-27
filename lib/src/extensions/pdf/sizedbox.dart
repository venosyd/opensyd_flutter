///
/// venosyd © 2016-2020. sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.extensions.pdf.sizedbox;

import 'package:pdf/widgets.dart' as pw;

///
/// Extensoes comodas para diminuir o callback hell
///
extension PDFZedboxes on pw.Widget {
  ///
  pw.Widget Expanded([int flex = 1]) => pw.Expanded(
        flex: flex,
        child: this,
      );

  ///
  pw.Widget Box(double size) => pw.SizedBox(
        height: size,
        width: size,
        child: this,
      );

  ///
  pw.Widget FillBox() => pw.SizedBox.expand(child: this);

  ///
  pw.Widget Height(double height) => pw.SizedBox(
        height: height,
        child: this,
      );

  ///
  pw.Widget Width(double width) => pw.SizedBox(
        width: width,
        child: this,
      );

  ///
  pw.Widget Sizedbox({
    double width,
    double height,
  }) {
    if (width == null) {
      return (height == null)
          ? pw.SizedBox.expand(child: this)
          : pw.SizedBox(height: height, child: this);
    } else
      return (height == null)
          ? pw.SizedBox(width: width, child: this)
          : pw.SizedBox(width: width, height: height, child: this);
  }
}
