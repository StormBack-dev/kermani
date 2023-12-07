import 'dart:io' show Platform;
import 'dart:math';

import 'package:flutter/material.dart';

final _data = MediaQueryData.fromView(WidgetsBinding.instance.window);

//==============================================
final bool isWindows = Platform.isWindows;
//==============================================
final bool isMobile = _data.size.shortestSide < 600;
double dialogWidth = isMobile ? _data.size.shortestSide * .75 : min(_data.size.shortestSide * .6, 500);

final double scrollbarThickness = isMobile
    ? 2
    : isWindows
        ? 10
        : 4;

//=============== text sizes ===================
final double textAdaptionDiff = isMobile ? 0 : 2;
double tinySize = 8 + textAdaptionDiff;
double smallSize = 10 + textAdaptionDiff;
double normalSize = 12 + textAdaptionDiff;
double mediumSize = 13 + textAdaptionDiff;
double largeSize = 16 + textAdaptionDiff;
double xLargeSize = 18 + textAdaptionDiff;
double xxLargeSize = 20 + textAdaptionDiff;

//=============== padding sizes ===================
final double paddingFactor = isMobile ? 1 : 1.5;
final double padding2 = 2 * paddingFactor;
final double padding4 = 4 * paddingFactor;
final double padding6 = 6 * paddingFactor;
final double padding8 = 8 * paddingFactor;
final double padding10 = 10 * paddingFactor;
final double padding12 = 12 * paddingFactor;
final double padding16 = 16 * paddingFactor;
final double padding20 = 20 * paddingFactor;
final double padding24 = 24 * paddingFactor;
final double padding32 = 32 * paddingFactor;
final double padding36 = 36 * paddingFactor;

//=============== icon sizes ===================
final double iconFactor = isMobile ? 1 : 1.3;
final double icon16 = 16 * iconFactor;
final double icon20 = 20 * iconFactor;
final double icon24 = 24 * iconFactor;
final double icon32 = 32 * iconFactor;
final double icon36 = 36 * iconFactor;
final double icon42 = 42 * iconFactor;
final double icon48 = 48 * iconFactor;

TextStyle getTextStyle({
  String? fontFamily,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? height,
  Color? color,
  Color? backgroundColor,
  TextDecoration? decoration,
}) {
  return TextStyle(
      fontFamily: fontFamily ?? 'iran_sans',
      fontSize: fontSize ?? mediumSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 1.5,
      fontStyle: fontStyle ?? FontStyle.normal,
      color: color,
      backgroundColor: backgroundColor ?? Colors.transparent,
      decoration: decoration ?? TextDecoration.none);
}
