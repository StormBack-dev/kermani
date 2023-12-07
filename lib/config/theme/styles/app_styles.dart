// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:kermani/config/theme/styles/app_size.dart';
import 'package:kermani/core/utils/context_extension.dart';
import 'package:kermani/features/settings/data/dto/font_family.dart' as FontFamily;

final _data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);

double titleTextSize = mediumSize;
double phraseTextSize = largeSize;
double secondaryTextSize = mediumSize;

//=============== element sizes ===================
const FontWeight ayahFontWeight = FontWeight.w400;

final double toolbarHeight = isMobile ? kToolbarHeight : 80;
final double toolbarActionPadding = isMobile ? padding2 : padding4;
final double searchBoxHeight = isMobile ? 48 : 56;
final double screenPadding = _data.size.shortestSide / 16;
final double mainPanelRadius = .5 * screenPadding;
final double mainPanelPadding = mainPanelRadius;
final double mainPanelVerticalPadding = mainPanelRadius / 2;
final double buttonRadius = mainPanelRadius / 2;
final double tabBarTopPadding = screenPadding / 2;
final double tabIndicatorPadding = 1.2 * screenPadding;
const double tabBarIndicatorWeight = 3.5;

TextStyle getTextStyle2(
  BuildContext context, {
  String? fontFamily,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? height,
  Color? color,
  Color? backgroundColor,
  TextDecoration? decoration,
}) {
  return getTextStyle(
    fontFamily: fontFamily ?? FontFamily.FontFamily.yekanBakh.name,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    height: height,
    backgroundColor: backgroundColor,
    decoration: decoration,
    color: color ?? context.textTheme.bodyLarge?.color,
  );
}

TextStyle getToolbarTitleTextStyle(
  BuildContext context, {
  Color? color,
  double? fontSize,
}) {
  return getTextStyle(
    fontFamily: FontFamily.FontFamily.yekanBakh.name,
    fontSize: FontFamily.FontFamily.yekanBakh.getRatio() * (fontSize ?? mediumSize),
    fontWeight: FontWeight.w500,
    color: color ?? context.scheme.onPrimary,
  );
}

TextStyle getListTitleTextStyle(BuildContext context,
    {Color? color, double? fontSize, FontFamily.FontFamily? fontFamily}) {
  return getTextStyle(
    fontSize: fontSize,
    color: color ?? context.textTheme.displayLarge?.color,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily?.name,
  );
}

TextStyle onPrimaryTextStyle(BuildContext context,
    {Color? color, double? fontSize, FontFamily.FontFamily? fontFamily, FontWeight? fontWeight = FontWeight.w600}) {
  return getTextStyle(
      color: color ?? context.scheme.onPrimary,
      fontFamily: fontFamily?.name,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

TextStyle onBackgroundTextStyle(BuildContext context,
    {Color? color, double? fontSize, FontFamily.FontFamily? fontFamily, FontWeight? fontWeight}) {
  return getTextStyle(
      color: color ?? context.scheme.onBackground,
      fontFamily: fontFamily?.name,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

TextStyle getAyahListTextStyle(
  BuildContext context, {
  Color? color,
  double? fontSize,
  double? height,
  FontWeight? fontWeight,
  Color? backgroundColor,
}) {
  return getTextStyle2(
    context,
    color: color ?? context.textTheme.displayLarge?.color,
    fontFamily: FontFamily.FontFamily.yekanBakh.name,
    fontSize: fontSize ?? FontFamily.FontFamily.yekanBakh.getRatio() * mediumSize,
    // height: height ?? 1.8,
    fontWeight: fontWeight ?? FontWeight.w500,
    backgroundColor: backgroundColor,
  );
}

TextStyle getDrawerTextStyle(BuildContext context, {Color? color}) {
  return getTextStyle(
    fontWeight: FontWeight.bold,
    color: color ?? Theme.of(context).appBarTheme.iconTheme?.color,
  );
}

TextStyle getButtonTextStyle(
  BuildContext context, {
  Color? color,
}) {
  return getTextStyle(
    fontWeight: FontWeight.bold,
    color: color ?? context.scheme.onBackground,
  );
}

TextStyle getDialogTitleTextStyle(
  BuildContext context,
) {
  return getTextStyle(
    fontSize: mediumSize,
    fontWeight: FontWeight.bold,
    color: context.scheme.primary,
  );
}

TextStyle getSettingCategoryTextStyle(BuildContext context, {Color? color}) {
  return getTextStyle(
      fontSize: largeSize, fontWeight: FontWeight.w600, color: color ?? context.scheme.onBackground.withOpacity(.8));
}

TextStyle getSettingItemTextStyle(BuildContext context, {Color? color}) {
  return getTextStyle2(context, fontWeight: FontWeight.w500, color: color);
}

TextStyle getSettingItemSubtitleTextStyle(BuildContext context) {
  return getTextStyle(
    color: Theme.of(context).hintColor,
    fontWeight: FontWeight.normal,
    fontSize: normalSize,
  );
}

TextStyle getDisabledTextStyle(BuildContext context) {
  return getTextStyle2(
    context,
    color: Theme.of(context).disabledColor,
    fontWeight: FontWeight.normal,
    fontSize: normalSize,
  );
}
