///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.deprecated;

import 'dart:core';

import 'package:flutter/material.dart';

import '../extensions/_module_.dart';
import 'bars/_module_.dart';
import 'themes/_module_.dart';

///
///
///
@Deprecated('Use FaIcon ou Icon')
class VxIcon extends StatelessWidget {
  ///
  const VxIcon(
    this.icon, {
    this.height,
    this.color,
  });

  ///
  final String icon;

  ///
  final double height;

  ///
  final Color color;

  @override
  Widget build(BuildContext context) => ImageIcon(
        AssetImage('assets/icons/$icon.png'),
        color: color ?? Colors.grey,
        size: height,
      ).Height(height);
}

///
///
///
@Deprecated('Use FaIcon ou Icon')
class VxPngIcon extends StatelessWidget {
  ///
  const VxPngIcon(
    this.image, {
    this.height = 64,
    this.color,
  });

  ///
  final String image;

  ///
  final double height;

  ///
  final Color color;

  @override
  Widget build(BuildContext context) => ImageIcon(
        AssetImage('assets/png/$image.png'),
        color: color,
        size: height,
      ).Height(height);
}

///
/// decoracao tipica dessa nova linguagem de design domindo o mundo
///
@Deprecated('Use widget.Rounded(BorderRadius.circular(<raio>)).Colored(<cor>)')
class RoundedBorder extends BoxDecoration {
  RoundedBorder({
    double radius = 24.0,
    Color color = Colors.white,
  }) : super(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        );
}

///
/// tela de apresentacao durante o carregamento
///
@Deprecated('Use qualquer coisa menos isso')
class UxSplashScreen extends StatefulWidget {
  ///
  const UxSplashScreen({
    this.photoSize,
    this.title,
    this.background = Colors.white,
    this.whitenavandstatus = false,
    this.loaderColor = Colors.white,
    this.image,
  });

  ///
  final Text title;

  ///
  final Color background;

  ///
  final bool whitenavandstatus;

  ///
  final Color loaderColor;

  ///
  final double photoSize;

  ///
  final Widget image;

  @override
  _UxSplashScreenState createState() => _UxSplashScreenState();
}

/// estado do widget acima
class _UxSplashScreenState extends State<UxSplashScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: AllColored(
          color: widget.background,
          whiteforeground: widget.whitenavandstatus,
          child: Scaffold(
            appBar: EmptyAppBar(color: widget.background),
            backgroundColor: widget.background,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // icone
                Center(child: widget.image) ?? Container(),

                // mensagem
                if (widget.title != null) widget.title,

                // loading
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.loaderColor,
                  ),
                ),

                // copyright year
                Text(
                  '© ${DateTime.now().year}',
                  style: const TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
