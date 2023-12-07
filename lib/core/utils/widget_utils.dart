import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kermani/config/theme/styles/app_size.dart';
import 'package:kermani/core/utils/material_inkwell.dart';

class WidgetUtils {
  static Offset getPosition(
      {required BuildContext context, bool fromCenter = false}) {
    final RenderBox renderBoxRed = context.findRenderObject() as RenderBox;
    final topLeftPosition = renderBoxRed.localToGlobal(Offset.zero);

    final Size size = getSize(context);
    return Offset(
      topLeftPosition.dx + (size.width / 2),
      topLeftPosition.dy + size.height / 2,
    );
  }

  static Size getSize(BuildContext context) {
    final RenderBox renderBoxRed = context.findRenderObject() as RenderBox;
    return renderBoxRed.size;
  }

  static RelativeRect getRelativeRect(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;
    final box = context.findRenderObject() as RenderBox;
    final rect = box.localToGlobal(Offset.zero) & box.size;
    return RelativeRect.fromSize(rect, windowSize);
  }

  static Widget getListSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding16),
      child: const Divider(
        color: Colors.grey,
      ),
    );
  }

  static Widget getLoading() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding8),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  static Widget getError(String text, {Function? onRetry}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          if (onRetry != null) const SizedBox(height: 36),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding16),
            child: Text(
              text,
              style: getTextStyle(
                  color: Colors.red[700],
                  fontSize: normalSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
          if (onRetry != null) const SizedBox(height: 24),
          if (onRetry != null)
            MaterialInkWell(
              onTap: () => onRetry.call(),
              child: Icon(
                Icons.refresh,
                color: Colors.grey[700],
                size: icon32,
              ),
            ),
        ],
      ),
    );
  }

  static SnackBar getSnackBar(
    BuildContext context,
    String content, {
    Color? bgColor,
    Duration? duration,
  }) {
    return SnackBar(
      backgroundColor: bgColor ?? Theme.of(context).primaryColor,
      content: Text(
        content,
        style: getTextStyle(
          color: Colors.white,
        ),
      ),
      duration: duration ?? const Duration(milliseconds: 2000),
    );
  }

  static void showSnack(BuildContext context, String content,
      {Color? bgColor, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
      context,
      content,
      bgColor: bgColor,
      duration: duration,
    ));
  }

  static void showErrorSnack(BuildContext context, String content,
      {Duration? duration}) {
    showSnack(context, content, bgColor: Colors.red[600], duration: duration);
  }

  static void showWarningSnack(BuildContext context, String content,
      {Duration? duration}) {
    showSnack(
      context,
      content,
      bgColor: Colors.yellow[700],
      duration: duration,
    );
  }

  static void showInfoSnack(BuildContext context, String content,
      {Duration? duration}) {
    showSnack(context, content, bgColor: Colors.blue[600], duration: duration);
  }

  static void showSuccessSnack(BuildContext context, String content,
      {Duration? duration}) {
    showSnack(context, content, bgColor: Colors.green[600], duration: duration);
  }

  static void showMainSnack(BuildContext context, String content,
      {Duration? duration}) {
    showSnack(context, content, bgColor: Colors.black87, duration: duration);
  }

  static Icon getBackIcon(BuildContext context, {Color? color}) {
    return Icon(
      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
      color: color ?? Theme.of(context).iconTheme.color,
    );
  }

  static void hideSoftKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static List<TextSpan> highlight(String source, String? query, Color bgColor) {
    if (query == null ||
        query.isEmpty ||
        !source.toLowerCase().contains(query.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(
          backgroundColor: bgColor,
        ),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  static void showLoadingDialog(BuildContext context, Widget text) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 15),
          text,
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
