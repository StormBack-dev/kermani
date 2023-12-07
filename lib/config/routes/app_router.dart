import 'package:flutter/material.dart' hide Title;
import 'package:kermani/core/constants/route_animation.dart';
import 'package:kermani/features/profile/presentation/widgets/profile_screen.dart';

mixin AppRouter {
  static const home = '/';

  static RouteFactory onGenerateRoute() {
    return (RouteSettings settings) {
      switch (settings.name) {
        case home:
        default:
          return FadeRoute(
            page: const ProfileScreen(),
            duration: const Duration(milliseconds: 300),
            pageTitle: 'پروفایل',
            routeSettings: const RouteSettings(name: 'ProfileScreen'),
          );
      }
    };
  }
}
