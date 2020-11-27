///
/// venosyd © 2016-2020
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.flutter.widgets.themes.applytheme;

import 'package:flutter/material.dart';

import 'tema.dart';

///
/// esse widget aplica os temas da statusbar e
/// da barra de notificacoes
///
class ApplyTheme extends StatelessWidget {
  ///
  const ApplyTheme({
    this.child,
    this.statusColor,
    this.whiteStatusForeground,
    this.navigationColor,
    this.whiteNavigationForeground,
    this.isdesktop = false,
  });

  ///
  final Widget child;

  ///
  final Color statusColor;

  ///
  final bool whiteStatusForeground;

  ///
  final Color navigationColor;

  ///
  final bool whiteNavigationForeground;

  ///
  final bool isdesktop;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: Tema.setStatusbarColors(
          statusColor: statusColor,
          whiteStatusForeground: whiteStatusForeground,
          navigationColor: navigationColor,
          whiteNavigationForeground: whiteNavigationForeground,
          isdesktop: isdesktop,
        ),
        builder: (_, __) => child,
      );
}

///
///
Future<void> themeApplyAllColored({
  Color color,
  bool whiteforeground = false,
  bool isdesktop = false,
}) async =>
    await _applytheme(
      navigationColor: color,
      statusColor: color,
      whiteStatusForeground: whiteforeground,
      whiteNavigationForeground: whiteforeground,
      isdesktop: isdesktop,
    );

///
///
Future<void> themeApplyBottomColored({
  Color color,
  bool whiteforeground = false,
  bool isdesktop = false,
}) async =>
    await _applytheme(
      navigationColor: color,
      statusColor: Colors.white,
      whiteStatusForeground: false,
      whiteNavigationForeground: whiteforeground,
      isdesktop: isdesktop,
    );

///
///
Future<void> themeApplyTopColored({
  Color color,
  bool whiteforeground = false,
  bool isdesktop = false,
}) async =>
    await _applytheme(
      navigationColor: Colors.white,
      statusColor: color,
      whiteStatusForeground: whiteforeground,
      whiteNavigationForeground: false,
      isdesktop: isdesktop,
    );

///
///
Future<void> themeApplyAllWhite({
  bool isdesktop = false,
}) async =>
    await _applytheme(
      navigationColor: Colors.white,
      statusColor: Colors.white,
      whiteStatusForeground: false,
      whiteNavigationForeground: false,
      isdesktop: isdesktop,
    );

///
///
Future<void> themeApplyAllGrey({
  bool isdesktop = false,
}) async =>
    await _applytheme(
      navigationColor: const Color(0xFFF5F5F5),
      statusColor: const Color(0xFFF5F5F5),
      whiteStatusForeground: false,
      whiteNavigationForeground: false,
      isdesktop: isdesktop,
    );

///
///
Future<void> _applytheme({
  Color statusColor,
  bool whiteStatusForeground,
  Color navigationColor,
  bool whiteNavigationForeground,
  bool isdesktop = false,
}) async =>
    await Tema.setStatusbarColors(
      statusColor: statusColor,
      whiteStatusForeground: whiteStatusForeground,
      navigationColor: navigationColor,
      whiteNavigationForeground: whiteNavigationForeground,
      isdesktop: isdesktop,
    );
