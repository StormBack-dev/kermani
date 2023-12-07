import 'package:flutter/material.dart';

EdgeInsetsGeometry _getPadding(List<double> padding) {
  if (padding.length == 1) {
    return EdgeInsets.all(padding[0]);
  }
  if (padding.length == 2) {
    return EdgeInsets.symmetric(horizontal: padding[0], vertical: padding[1]);
  }
  if (padding.length == 4) {
    return EdgeInsetsDirectional.only(
      top: padding[0],
      start: padding[1],
      bottom: padding[2],
      end: padding[3],
    );
  }
  return EdgeInsets.zero;
}

BorderRadiusGeometry _getRadius(List<double> radius) {
  if (radius.length == 1) {
    return BorderRadius.circular(radius[0]);
  }
  // if (radius.length == 2) {
  //   return BorderRadius.vertical(
  //     top: Radius.circular(radius[0]),
  //     bottom: Radius.circular(radius[1]),
  //   );
  // }
  if (radius.length == 4) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius[0]),
      bottomLeft: Radius.circular(radius[1]),
      bottomRight: Radius.circular(radius[2]),
      topRight: Radius.circular(radius[3]),
    );
  }
  return BorderRadius.zero;
}

class ContainerX extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;

  /// border radius in this order:
  ///
  /// [ [topLeft, bottomLeft, bottomRight, topRight] ]
  ///
  /// or [ [all] ]
  final List<double>? radius;

  /// padding in this order:
  ///
  /// [ [top, start, bottom, end] ]
  ///
  /// or [ [horizontal, vertical] ]
  ///
  /// or [ [all] ]
  final List<double>? padding;

  /// margin in this order:
  ///
  /// [ [top, start, bottom, end] ]
  ///
  /// or [ [horizontal, vertical] ]
  ///
  /// or [ [all] ]
  final List<double>? margin;
  final Color? borderColor;
  final double? borderWidth;
  final Color? shadowColor;
  final double? blurRadius;
  final double? spreadRadius;
  final Offset? shadowOffset;
  final AlignmentGeometry? alignment;
  final ImageProvider? image;
  final BoxFit imageBoxFit;
  final BoxShape shape;
  final Gradient? gradient;
  final Matrix4? transform;

  const ContainerX({
    Key? key,
    this.width,
    this.height,
    this.color = Colors.transparent,
    this.radius,
    this.padding,
    this.margin,
    this.borderColor,
    this.borderWidth,
    this.shadowColor,
    this.blurRadius,
    this.spreadRadius,
    this.shadowOffset,
    this.alignment,
    this.image,
    this.imageBoxFit = BoxFit.fill,
    this.shape = BoxShape.rectangle,
    this.gradient,
    this.child,
    this.transform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: padding != null ? _getPadding(padding!) : EdgeInsets.zero,
      margin: margin != null ? _getPadding(margin!) : EdgeInsets.zero,
      transform: transform,
      decoration: image != null
          ? BoxDecoration(
              image: DecorationImage(
                image: image!,
                fit: imageBoxFit,
              ),
            )
          : BoxDecoration(
              shape: shape,
              gradient: gradient,
              color: gradient == null ? color : null,
              borderRadius: radius != null ? _getRadius(radius!) : null,
              border: borderColor != null
                  ? Border.all(
                      color: borderColor!,
                      width: borderWidth ?? 1,
                    )
                  : null,
              boxShadow: shadowColor != null
                  ? [
                      BoxShadow(
                        color: shadowColor!,
                        blurRadius: blurRadius ?? 5,
                        spreadRadius: spreadRadius ?? 0,
                        offset: shadowOffset ?? Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
      child: child,
    );
  }
}

class AnimatedContainerX extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color color;

  /// border radius in this order: [ [topLeft, bottomLeft, bottomRight, topRight] ]
  final List<double>? radius;

  /// padding in this order:
  ///
  /// [ [top, start, bottom, end] ]
  ///
  /// or [ [horizontal, vertical] ]
  ///
  /// or [ [all] ]
  final List<double>? padding;

  /// margin in this order:
  ///
  /// [ [top, start, bottom, end] ]
  ///
  /// or [ [horizontal, vertical] ]
  ///
  /// or [ [all] ]
  final List<double>? margin;
  final Color? borderColor;
  final double? borderWidth;
  final Color? shadowColor;
  final double? blurRadius;
  final Offset? shadowOffset;
  final AlignmentGeometry? alignment;
  final ImageProvider? image;
  final BoxShape shape;
  final Gradient? gradient;
  final Duration duration;

  const AnimatedContainerX(
      {Key? key,
      this.width,
      this.height,
      this.color = Colors.transparent,
      this.radius,
      this.padding,
      this.margin,
      this.borderColor,
      this.borderWidth,
      this.shadowColor,
      this.blurRadius,
      this.shadowOffset,
      this.alignment,
      this.image,
      this.shape = BoxShape.rectangle,
      this.gradient,
      this.duration = const Duration(milliseconds: 200),
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      alignment: alignment,
      padding: padding != null ? _getPadding(padding!) : EdgeInsets.zero,
      margin: margin != null ? _getPadding(margin!) : EdgeInsets.zero,
      decoration: image != null
          ? BoxDecoration(
              image: DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              ),
            )
          : BoxDecoration(
              shape: shape,
              gradient: gradient,
              color: color,
              borderRadius: radius != null ? _getRadius(radius!) : null,
              border: borderColor != null
                  ? Border.all(
                      color: borderColor!,
                      width: borderWidth ?? 1,
                    )
                  : null,
              boxShadow: shadowColor != null
                  ? [
                      BoxShadow(
                        color: shadowColor!,
                        blurRadius: blurRadius ?? 5,
                        offset: shadowOffset ?? Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
      duration: duration,
      child: child,
    );
  }
}
