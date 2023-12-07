import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kermani/features/settings/data/dto/font_family.dart';

class TextDisplaySettings {
  FontFamily fontFamily;
  FontStyle fontStyle ;
  double fontScale;
  double lineHeight;
  final Color? textColor;
  final Color? backgroundColor;

  TextDisplaySettings({
    this.fontFamily = FontFamily.iranNastaliq,
     this.fontStyle = FontStyle.normal,
    this.fontScale = 1.0,
    this.lineHeight = 1.5,
    this.textColor,
    this.backgroundColor,
  });

  TextDisplaySettings copyWith({
    FontFamily? fontFamily,
    FontStyle? fontStyle,
    double? fontScale,
    double? lineHeight,
    final Color? textColor,
    final Color? backgroundColor,
  }) {
    return TextDisplaySettings(
      lineHeight: lineHeight ?? this.lineHeight,
      fontStyle: fontStyle ?? this.fontStyle,
      fontScale: fontScale ?? this.fontScale,
      fontFamily: fontFamily ?? this.fontFamily,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  TextDisplaySettings.fromJson(Map<String, dynamic> json)
      : lineHeight = json['lineHeight'] as double,
      fontStyle = FontStyles.fromName(json['fontStyle'].toString()) ?? FontStyle.normal,
        fontScale = json['fontSize'] as double,
        fontFamily = FontFamilies.fromName(json['fontFamily'].toString()) ?? FontFamily.iranNastaliq,
        backgroundColor = json['backgroundColor'] == null ? null : Color(json['backgroundColor'] as int),
        textColor = json['textColor'] == null ? null : Color(json['textColor'] as int);

  Map<String, dynamic> toJson() => {
        'lineHeight': lineHeight,
        'fontSize': fontScale,
        'fontFamily': fontFamily.name,
        'fontStyle': fontStyle.name,
        'textColor': textColor?.value,
        'backgroundColor': backgroundColor?.value,
      };

  double scaleTextSize(double textSize) {
    return textSize * fontScale;
  }

  double scaleTitleSize(double textSize) {
    return textSize * ((max(1, fontScale) - 1) / 2 + 1);
  }
}
