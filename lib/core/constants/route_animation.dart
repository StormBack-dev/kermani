import 'package:flutter/material.dart';
import 'package:kermani/core/constants/reveal_animation.dart';
import 'package:kermani/core/utils/widget_utils.dart';

enum _SlideDirection { right, left, up, down }

const _duration = Duration(milliseconds: 1000);

class _SlideRoute extends PageRouteBuilder<dynamic> {
  final Widget page;
  final _SlideDirection slideDirection;
  final Duration? duration;
  final String? pageTitle;
  final RouteSettings? routeSettings;

  _SlideRoute({
    required this.slideDirection,
    required this.page,
    this.duration,
    this.pageTitle,
    this.routeSettings,
  }) : super(
          pageBuilder:
              (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return page;
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            Offset? beginOffset;
            switch (slideDirection) {
              case _SlideDirection.right:
                beginOffset = const Offset(1.0, 0.0);
                break;
              case _SlideDirection.left:
                beginOffset = const Offset(-1.0, 0.0);
                break;
              case _SlideDirection.up:
                beginOffset = const Offset(0.0, 1.0);
                break;
              case _SlideDirection.down:
                beginOffset = const Offset(0.0, -1.0);
                break;
            }
            return SlideTransition(
              position: Tween<Offset>(
                begin: beginOffset,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

class SlideRightRoute extends _SlideRoute {
  SlideRightRoute({required Widget page, Duration? duration, RouteSettings? routeSettings, String? pageTitle})
      : super(
          slideDirection: _SlideDirection.right,
          page: page,
          duration: duration,
          routeSettings: routeSettings,
          pageTitle: pageTitle,
        );
}

class SlideLeftRoute extends _SlideRoute {
  SlideLeftRoute({required Widget page, Duration? duration, RouteSettings? routeSettings, String? pageTitle})
      : super(
          slideDirection: _SlideDirection.left,
          page: page,
          duration: duration,
          routeSettings: routeSettings,
          pageTitle: pageTitle,
        );
}

class SlideUpRoute extends _SlideRoute {
  SlideUpRoute({required Widget page, Duration? duration, RouteSettings? routeSettings, String? pageTitle})
      : super(
          slideDirection: _SlideDirection.up,
          page: page,
          duration: duration,
          routeSettings: routeSettings,
          pageTitle: pageTitle,
        );
}

class SlideDownRoute extends _SlideRoute {
  SlideDownRoute({required Widget page, Duration? duration, RouteSettings? routeSettings, String? pageTitle})
      : super(
          slideDirection: _SlideDirection.down,
          page: page,
          duration: duration,
          routeSettings: routeSettings,
          pageTitle: pageTitle,
        );
}

class ScaleRoute extends PageRouteBuilder<dynamic> {
  final Widget page;

  final Duration? duration;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  ScaleRoute({
    required this.page,
    this.duration,
    this.routeSettings,
    this.pageTitle,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              ),
            ),
            child: child,
          ),
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

class RotationRoute extends PageRouteBuilder<dynamic> {
  final Widget page;

  final Duration? duration;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  RotationRoute({
    required this.page,
    this.duration,
    this.routeSettings,
    this.pageTitle,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          ),
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

class SizeRoute extends PageRouteBuilder<dynamic> {
  final Widget page;

  final Duration? duration;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  SizeRoute({
    required this.page,
    this.duration,
    this.routeSettings,
    this.pageTitle,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Align(
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

class FadeRoute extends PageRouteBuilder<dynamic> {
  final Widget page;

  final Duration? duration;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  FadeRoute({
    required this.page,
    this.duration,
    this.routeSettings,
    this.pageTitle,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

class EnterExitRoute extends PageRouteBuilder<dynamic> {
  final Widget enterPage;
  final Widget exitPage;

  final Duration? duration;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  EnterExitRoute({
    required this.exitPage,
    required this.enterPage,
    this.duration,
    this.routeSettings,
    this.pageTitle,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              ),
            ],
          ),
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

//Navigator.push(context, EnterExitRoute(exitPage: this, enterPage: Screen2()))

class ScaleRotateRoute extends PageRouteBuilder<dynamic> {
  final Widget page;

  final Duration? duration;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  ScaleRotateRoute({
    required this.page,
    this.duration,
    this.routeSettings,
    this.pageTitle,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            ),
          ),
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

class CircularRoute extends PageRouteBuilder<dynamic> {
  final Widget page;
  final Duration? duration;
  final Offset? offset;
  final Color? startColor;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  CircularRoute({
    required this.page,
    this.duration,
    this.offset,
    this.startColor,
    this.routeSettings,
    this.pageTitle,
  }) : super(
          pageBuilder:
              (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return page;
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            return CircularRevealAnimation(
              minRadius: 0,
              centerOffset: offset,
              animation: animation,
              child: child,
              startColor: startColor,
            );
          },
          settings: routeSettings,
        );

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

class RelativeRoute extends PageRouteBuilder<dynamic> {
  final BuildContext parentContext;
  final Widget page;
  final Duration? duration;
  final RouteSettings? routeSettings;
  final String? pageTitle;

  RelativeRoute({
    required this.parentContext,
    required this.page,
    this.duration,
    this.routeSettings,
    this.pageTitle,
  }) : super(
            pageBuilder:
                (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return page;
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              final relativeRect = WidgetUtils.getRelativeRect(parentContext);
              final rectAnimation = RelativeRectTween(
                begin: relativeRect,
                end: RelativeRect.fill,
              ).chain(CurveTween(curve: Curves.linearToEaseOut)).animate(animation);

              return Stack(
                children: [
                  PositionedTransition(rect: rectAnimation, child: child),
                ],
              );
            },
            settings: routeSettings);

  @override
  Duration get transitionDuration => duration ?? _duration;

  @override
  String? get barrierLabel => pageTitle;
}

//============================================================

// return MaterialApp(
// title: 'Transitions Tutorial',
// theme: ThemeData(
// pageTransitionsTheme: PageTransitionsTheme(builders: {
// TargetPlatform.iOS: ZoomSlideUpTransitionsBuilder(),
// TargetPlatform.android: RotationFadeTransitionBuilder(),
// })
// ),
// home: MyHomePage(title: 'Transitions Tutorial'),
// );

class ZoomSlideUpTransitionsBuilder extends PageTransitionsBuilder {
  const ZoomSlideUpTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _ZoomSlideUpTransitionsBuilder(routeAnimation: animation, child: child);
  }
}

class _ZoomSlideUpTransitionsBuilder extends StatelessWidget {
  _ZoomSlideUpTransitionsBuilder({
    Key? key,
    required Animation<double> routeAnimation,
    required this.child,
  })  : _scaleAnimation = CurvedAnimation(
          parent: routeAnimation,
          curve: Curves.linear,
        ).drive(_scaleTween),
        _slideAnimation = CurvedAnimation(
          parent: routeAnimation,
          curve: Curves.linear,
        ).drive(_kBottomUpTween),
        super(key: key);

  final Animation<Offset> _slideAnimation;
  final Animation<double> _scaleAnimation;

  static final Animatable<double> _scaleTween = Tween<double>(begin: 0.0, end: 1);
  static final Animatable<Offset> _kBottomUpTween = Tween<Offset>(
    begin: const Offset(0.0, 1.0),
    end: const Offset(0.0, 0.0),
  );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: child,
      ),
    );
  }
}

class RotationFadeTransitionBuilder extends PageTransitionsBuilder {
  const RotationFadeTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _RotationFadeTransitionBuilder(routeAnimation: animation, child: child);
  }
}

class _RotationFadeTransitionBuilder extends StatelessWidget {
  _RotationFadeTransitionBuilder({
    Key? key,
    required Animation<double> routeAnimation,
    required this.child,
  })  : _turnsAnimation = routeAnimation.drive(_linearToEaseOut),
        _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  static final Animatable<double> _linearToEaseOut = CurveTween(curve: Curves.linearToEaseOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  final Animation<double> _turnsAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _turnsAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: child,
      ),
    );
  }
}

//============================================================

class HeroDialogRoute<T> extends PageRoute<T> {
  final String? barrierLabelString;
  final WidgetBuilder? builder;
  final Color? barrierColor2;

  HeroDialogRoute({this.builder, this.barrierLabelString, this.barrierColor2}) : super();

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => barrierColor2 ?? Colors.black87.withOpacity(0);

  @override
  String get barrierLabel => barrierLabelString ?? '';

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut), child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder?.call(context) ?? Container();
  }
}
