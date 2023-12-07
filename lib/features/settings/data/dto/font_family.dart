import 'package:flutter/material.dart';
import 'package:kermani/generated/l10n.dart';

enum FontFamily {
  iranSans,
  iranNastaliq,
  iranYekan,
  yekanBakh,
}

enum FontStyle {
  normal,
  bold,
}

extension FontStyles on FontStyle {
  String get name {
    switch (this) {
      case FontStyle.bold:
        return 'bold';
      default:
        return 'normal';
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case FontStyle.bold:
        return S.of(context).fontBold;
      default:
        return S.of(context).fontNormal;
    }
      
  }

  static List<FontStyle> textFontStyleCollection = [
    FontStyle.normal,
    FontStyle.bold,
  ];
  static FontStyle? fromName(String name) {
    for (final fm in FontStyle.values) {
      if (fm.name == name) {
        return fm;
      }
    }
    return null;
  }
}

extension FontFamilies on FontFamily {
  String get name {
    switch (this) {
      case FontFamily.iranNastaliq:
        return 'iran_nastaliq';
      case FontFamily.iranYekan:
        return 'iran_yekan';
      case FontFamily.yekanBakh:
        return 'yekan_bakh';
      default:
        return 'yekan_bakh';
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case FontFamily.iranNastaliq:
        return S.of(context).fontIranNastaliq;
      case FontFamily.iranYekan:
        return S.of(context).fontIranYekan;
      case FontFamily.yekanBakh:
        return S.of(context).fontYekanBakh;
      default:
        return S.of(context).fontYekanBakh;
    }
  }

  double getRatio() {
    switch (this) {
      case FontFamily.iranNastaliq:
        return 1;
      case FontFamily.iranYekan:
        return 0.6;
      case FontFamily.yekanBakh:
        return 0.6;
      default:
        return 1;
    }
  }

  double getLineSpacingRatio() {
    switch (this) {
      case FontFamily.iranSans:
        return 1;
      case FontFamily.iranNastaliq:
        return 1.5;
      case FontFamily.iranYekan:
        return 1.2;
      case FontFamily.yekanBakh:
        return 1.2;
      default:
        return 1;
    }
  }

  double normalizeSize(double fontSize) {
    return fontSize * getRatio();
  }

  double normalizeLineSpacing(double height) {
    return height * getLineSpacingRatio();
  }

  static FontFamily? fromName(String name) {
    for (final fm in FontFamily.values) {
      if (fm.name == name) {
        return fm;
      }
    }
    return null;
  }

  static List<FontFamily> textFontCollection = [
    FontFamily.iranNastaliq,
    FontFamily.iranYekan,
    FontFamily.yekanBakh,
  ];
}
