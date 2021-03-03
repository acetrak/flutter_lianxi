import 'package:flutter/material.dart';
// ListView去掉边界水波纹

class _OverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          // 不显示头部水波纹
          showLeading: false,
          // 不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
      case TargetPlatform.linux:
        break;
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.windows:
        break;
    }
    return child;
  }
}

class NoRippleOverscroll extends StatelessWidget {
  final ListView child;

  NoRippleOverscroll({this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _OverScrollBehavior(),
      child: child,
    );
  }
}
