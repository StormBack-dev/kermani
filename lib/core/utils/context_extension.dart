import 'package:flutter/material.dart';
import 'package:kermani/config/theme/styles/app_styles.dart';
import 'package:kermani/core/utils/theme_extensions.dart';


extension ContextExtenstion on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get style => getTextStyle2(this);
  bool get isDark => Theme.of(this).isDark;
  bool get isLight => Theme.of(this).isLight;
  Size get sizes => MediaQuery.sizeOf(this);
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  Future<Object?> toNamedAndRemoveUntilWithRoute(String routeName, {Object? args}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => route.settings.name == routeName, arguments: args);
  }

  Future<Object?> toNamedWithRoute(String routeName, {Object? args}) {
    return Navigator.of(this).pushNamed(routeName, arguments: args);
  }

  Future toPush(Route route) {
    return Navigator.of(this).push(route);
  }

  Future<Object?> toPushReplacement(String routeName) {
    return Navigator.of(this).pushReplacementNamed(routeName);
  }

  void toPop({Object? args}) {
    return Navigator.of(this).pop(args);
  }
}
