// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin AppImages {
  static const imagePath = 'assets/images/';
  static const iconsPath = 'assets/icons/';

  static Widget maleAvatar({String? label, Color? color}) => SvgPicture.asset(
        '${iconsPath}profile/male_avatar.svg',
        color: color,
        colorBlendMode: BlendMode.lighten,
        semanticsLabel: label ?? '',
      );
}
