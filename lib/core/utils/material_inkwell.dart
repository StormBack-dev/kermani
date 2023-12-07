import 'package:flutter/material.dart';

class MaterialInkWell extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final Color? splashColor;
  final Color? focusColor;
  final FocusNode? focusNode;

  const MaterialInkWell({
    Key? key,
    this.onTap,
    this.child,
    this.splashColor,
    this.focusColor,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: splashColor,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        onTap: onTap,
        child: child,
        focusColor: focusColor,
        focusNode: focusNode,
      ),
    );
  }
}
